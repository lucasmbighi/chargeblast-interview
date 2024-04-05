import Fluent
import Vapor

struct OrdersController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        let orders = routes.grouped("api")
        orders.get("orders", use: index)
        orders.post("orders", use: create)
        orders.post("find", "orders", use: find)
    }

    func index(req: Request) async throws -> [Order] {
        try await Order.query(on: req.db).all()
    }

    func create(req: Request) async throws -> Order {
        let order = try req.content.decode(Order.self)
        try await order.save(on: req.db)
        return order
    }

    func find(req: Request) async throws -> [Order] {
        let findRequest = try req.content.decode(FindRequest.self)
        return try await Order.query(on: req.db)
            .filter(\.$product == findRequest.name)
            .all()
    }
}
