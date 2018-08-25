class NotePolicy < ApplicationPolicy
    def update?
        Note.where(category: user.categories).include?(record)
    end
    
    def show?
        Note.where(category: user.categories).include?(record)
    end
end