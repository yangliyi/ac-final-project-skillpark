require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Admin::SkillsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Admin::Skill. As you add validations to Admin::Skill, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Admin::SkillsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all admin_skills as @admin_skills" do
      skill = Admin::Skill.create! valid_attributes
      get :index, {}, valid_session
      expect(assigns(:admin_skills)).to eq([skill])
    end
  end

  describe "GET #show" do
    it "assigns the requested admin_skill as @admin_skill" do
      skill = Admin::Skill.create! valid_attributes
      get :show, {:id => skill.to_param}, valid_session
      expect(assigns(:admin_skill)).to eq(skill)
    end
  end

  describe "GET #new" do
    it "assigns a new admin_skill as @admin_skill" do
      get :new, {}, valid_session
      expect(assigns(:admin_skill)).to be_a_new(Admin::Skill)
    end
  end

  describe "GET #edit" do
    it "assigns the requested admin_skill as @admin_skill" do
      skill = Admin::Skill.create! valid_attributes
      get :edit, {:id => skill.to_param}, valid_session
      expect(assigns(:admin_skill)).to eq(skill)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Admin::Skill" do
        expect {
          post :create, {:admin_skill => valid_attributes}, valid_session
        }.to change(Admin::Skill, :count).by(1)
      end

      it "assigns a newly created admin_skill as @admin_skill" do
        post :create, {:admin_skill => valid_attributes}, valid_session
        expect(assigns(:admin_skill)).to be_a(Admin::Skill)
        expect(assigns(:admin_skill)).to be_persisted
      end

      it "redirects to the created admin_skill" do
        post :create, {:admin_skill => valid_attributes}, valid_session
        expect(response).to redirect_to(Admin::Skill.last)
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved admin_skill as @admin_skill" do
        post :create, {:admin_skill => invalid_attributes}, valid_session
        expect(assigns(:admin_skill)).to be_a_new(Admin::Skill)
      end

      it "re-renders the 'new' template" do
        post :create, {:admin_skill => invalid_attributes}, valid_session
        expect(response).to render_template("new")
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested admin_skill" do
        skill = Admin::Skill.create! valid_attributes
        put :update, {:id => skill.to_param, :admin_skill => new_attributes}, valid_session
        skill.reload
        skip("Add assertions for updated state")
      end

      it "assigns the requested admin_skill as @admin_skill" do
        skill = Admin::Skill.create! valid_attributes
        put :update, {:id => skill.to_param, :admin_skill => valid_attributes}, valid_session
        expect(assigns(:admin_skill)).to eq(skill)
      end

      it "redirects to the admin_skill" do
        skill = Admin::Skill.create! valid_attributes
        put :update, {:id => skill.to_param, :admin_skill => valid_attributes}, valid_session
        expect(response).to redirect_to(skill)
      end
    end

    context "with invalid params" do
      it "assigns the admin_skill as @admin_skill" do
        skill = Admin::Skill.create! valid_attributes
        put :update, {:id => skill.to_param, :admin_skill => invalid_attributes}, valid_session
        expect(assigns(:admin_skill)).to eq(skill)
      end

      it "re-renders the 'edit' template" do
        skill = Admin::Skill.create! valid_attributes
        put :update, {:id => skill.to_param, :admin_skill => invalid_attributes}, valid_session
        expect(response).to render_template("edit")
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested admin_skill" do
      skill = Admin::Skill.create! valid_attributes
      expect {
        delete :destroy, {:id => skill.to_param}, valid_session
      }.to change(Admin::Skill, :count).by(-1)
    end

    it "redirects to the admin_skills list" do
      skill = Admin::Skill.create! valid_attributes
      delete :destroy, {:id => skill.to_param}, valid_session
      expect(response).to redirect_to(admin_skills_url)
    end
  end

end
