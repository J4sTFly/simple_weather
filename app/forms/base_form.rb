class BaseForm
  include ActiveModel::Model
  include ActiveModel::Attributes

  def initialize(**incoming_attributes)
    super incoming_attributes.slice(*self.class.attribute_names)
  end

  def attributes
    super.symbolize_keys
  end
end
