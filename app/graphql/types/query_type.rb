module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.
    field :items,
          [Types::ItemType],
          null: false,
          description: "Return a list of items in the martian library"

    def items
      Item.preload(:user)
    end

    field :me, Types:UserType, null: true

    def me
      context[:current_user]
    end
  end
end
