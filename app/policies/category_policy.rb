class CategoryPolicy < ApplicationPolicy
    def update?
        record.user_id == user.id
    end
    
    def show?
        record.user_id == user.id
    end
end