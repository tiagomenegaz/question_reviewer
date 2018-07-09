class BaseService

  attr_reader :errors

  def self.call(*args)
    new(*args).call
  end

  def self.call!(*args)
    new(*args).call!
  end

  def add_errors(service_errors)
    errors[:base] += service_errors.delete(:base)
    errors.merge!(service_errors)
  end

  def errors?
    errors.values.flatten.any?
  end

  def success?
    !errors?
  end
end