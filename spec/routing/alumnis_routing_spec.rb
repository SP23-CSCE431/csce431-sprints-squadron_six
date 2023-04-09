require 'rails_helper'

RSpec.describe AlumnisController, type: :routing do
  describe 'routing' do
    it 'routes to #index' do
      expect(get: '/alumnis').to route_to('alumnis#index')
    end

    it 'routes to #new' do
      expect(get: '/alumnis/new').to route_to('alumnis#new')
    end

    it 'routes to #show' do
      expect(get: '/alumnis/1').to route_to('alumnis#show', id: '1')
    end

    it 'routes to #edit' do
      expect(get: '/alumnis/1/edit').to route_to('alumnis#edit', id: '1')
    end

    it 'routes to #create' do
      expect(post: '/alumnis').to route_to('alumnis#create')
    end

    it 'routes to #update via PUT' do
      expect(put: '/alumnis/1').to route_to('alumnis#update', id: '1')
    end

    it 'routes to #update via PATCH' do
      expect(patch: '/alumnis/1').to route_to('alumnis#update', id: '1')
    end

    it 'routes to #destroy' do
      expect(delete: '/alumnis/1').to route_to('alumnis#destroy', id: '1')
    end

    context 'with search parameter' do
      it 'routes to #index with search parameter' do
        expect(get: '/alumnis?search=test').to route_to('alumnis#index', search: 'test')
      end
    end

    context 'with invalid search parameter' do
      it 'does not route to #index with invalid search parameter' do
        expect(get: '/alumnis?invalid_param=test').not_to route_to('alumnis#index')
      end
    end

    context 'as admin' do
      it 'routes to #create' do
        expect(post: '/alumnis', params: { isadmin: true }).to route_to('alumnis#create')
      end

      it 'routes to #update via PUT' do
        expect(put: '/alumnis/1', params: { isadmin: true }).to route_to('alumnis#update', id: '1')
      end

      it 'routes to #update via PATCH' do
        expect(patch: '/alumnis/1', params: { isadmin: true }).to route_to('alumnis#update', id: '1')
      end

      it 'routes to #destroy' do
        expect(delete: '/alumnis/1', params: { isadmin: true }).to route_to('alumnis#destroy', id: '1')
      end
    end

    # context 'as non-admin' do
    #   it 'does not route to #create' do
    #     expect(post: '/alumnis').not_to route_to('alumnis#create')
    #   end

    #   it 'does not route to #update via PUT' do
    #     expect(put: '/alumnis/1').not_to route_to('alumnis#update', id: '1')
    #   end

    #   it 'does not route to #update via PATCH' do
    #     expect(patch: '/alumnis/1', params: { isadmin: false }).not_to route_to('alumnis#update', id: '1')
    #   end
      
    #   it 'does not route to #destroy' do
    #     expect(delete: '/alumnis/1', params: { isadmin: false }).not_to route_to('alumnis#destroy', id: '1')
    #   end
    # end

    # context 'as authenticated user' do
    #   it 'routes to #edit' do
    #     expect(get: '/alumnis/1/edit', session: { user_id: 1 }).to route_to('alumnis#edit', id: '1')
    #   end

    #   it 'does not route to #new' do
    #    expect(get: '/alumnis/new', session: { user_id: 1 }).not_to route_to('alumnis#new')
    #   end
    # end

    # context 'as unauthenticated user' do
    #   it 'does not route to #new' do
    #     expect(get: '/alumnis/new').not_to route_to('alumnis#new')
    #   end

    #   it 'does not route to #edit' do
    #     expect(get: '/alumnis/1/edit').not_to route_to('alumnis#edit', id: '1')
    #   end

    #   it 'does not route to #create' do
    #     expect(post: '/alumnis').not_to route_to('alumnis#create')
    #   end

    #   it 'does not route to #update via PUT' do
    #     expect(put: '/alumnis/1').not_to route_to('alumnis#update', id: '1')
    #   end

    #   it 'does not route to #update via PATCH' do
    #     expect(patch: '/alumnis/1').not_to route_to('alumnis#update', id: '1')
    #   end

    #   it 'does not route to #destroy' do
    #     expect(delete: '/alumnis/1').not_to route_to('alumnis#destroy', id: '1')
    #   end
    # end
  end
end