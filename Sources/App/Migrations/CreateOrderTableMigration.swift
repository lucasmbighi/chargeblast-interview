import Fluent

struct CreateOrderTableMigration: AsyncMigration {
    func prepare(on database: Database) async throws {
        try await database.schema("orders")
            .id()
            .field("price", .double, .required)
            .field("currency", .string, .required)
            .field("product", .string, .required)
            .field("customer_email", .string, .required)
            .create()
    }

    func revert(on database: Database) async throws {
        try await database.schema("orders").delete()
    }
}
