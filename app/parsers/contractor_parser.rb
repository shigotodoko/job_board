module ContractorParser
  def self.call(post_params)
    "Empresa: #{post_params[:contractor_company_name]}<br>" +
    "Responsavel: #{post_params[:contractor_person_name]}<br>" +
    "Telefone: #{post_params[:contractor_phone_number]}<br>" +
    "E-mail: #{post_params[:contractor_mail_address]}<br>" +
    "Endereco: #{post_params[:contractor_address]}"
  end
end
