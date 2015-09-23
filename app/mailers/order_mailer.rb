class OrderMailer < ActionMailer::Base
  default from: 'order@abardacha.ru'

  def new_order(order)
    @order = order
    mail(to: "abardacha@gmail.com", subject: "Новая заявка на #{order.landing}")
  end
end