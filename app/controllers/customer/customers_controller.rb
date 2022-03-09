class Customer::CustomersController < ApplicationController
  before_action :authenticate_customer!
  def show
    @customer = Customer.find(current_customer.id)
  end

  def edit
    @customer = Customer.find(current_customer.id)
  end
  
  def update
    @customer = Customer.find(current_customer.id)
    if @customer.update(customer_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end

  def confim
  end
  def destroy
    @customer = current_customer
    @customer.update(is_unsubscrib: true)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end
  
  private
  
  def customer_params
    params.require(:customer).permit(
      :family_name, 
      :first_name, 
      :family_name_kana, 
      :first_name_kana,
      :email,
      :postal_code,
      :address,
      :phone_number,
    )
  end
end
