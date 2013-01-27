class VcfToContactsController < ApplicationController
  def create
    @vcf_card = params[:vcf_to_contacts][:file]
  end
end
