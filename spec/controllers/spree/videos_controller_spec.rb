RSpec.describe Spree::VideosController, type: :controller do

  before do
  end

  context '#show' do
    it 'accepts path as root' do
      page = create(:page, slug: '/', stores: [store])
      request.path = page.slug
      spree_get :show, path: page.slug
      expect(response).to be_success
    end

    it 'accepts path as string' do
      page = create(:page, slug: 'hello', stores: [store])
      request.path = page.slug
      spree_get :show, path: page.slug
      expect(response).to be_success
    end

    it 'accepts path as nested' do
      page = create(:page, slug: 'aa/bb/cc', stores: [store])
      request.path = page.slug
      spree_get :show, path: page.slug
      expect(response).to be_success
    end

    it 'respond with a 404 when no page exists' do
      spree_get :show
      expect(response.response_code).to be(404)
    end
  end
end
