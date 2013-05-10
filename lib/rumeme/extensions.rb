unless Object.method_defined?(:blank?)
  class Object
    def blank?
      self.nil? || self.empty?
    end
  end
end
