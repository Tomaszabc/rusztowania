# frozen_string_literal: true

ActiveAdmin.register_page 'Dashboard' do
  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  content title: proc { I18n.t('active_admin.dashboard') } do
    @orders_grouped_by_site = Order.group(:building_site).count

    div style: 'display: flex; justify-content: center;' do
      panel 'Welcome to admin panel.' do
        div style: 'text-align: center;' do
          ' Here You can add Parts, Users, Delivery Emails and see all scaffold orders.'
        end
      end
    end

    columns do
      column do
        panel 'User Statistics' do
          ul do
            li "Total Users: #{User.count}"
          end
        end
      end

      column do
        panel 'Order Statistics' do
          ul do
            li "Total Orders: #{Order.count}"
          end
        end
      end

      column do
        panel 'Part Statistics' do
          ul do
            li "Total Parts: #{Part.count}"
          end
        end
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
    # columns do
    #   column do
    #     panel "Recent Posts" do
    #       ul do
    #         Post.recent(5).map do |post|
    #           li link_to(post.title, admin_post_path(post))
    #         end
    #       end
    #     end
    #   end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end

    div style: 'display: flex; justify-content: center;' do
      panel 'Orders by Building Site' do
        @labels = @orders_grouped_by_site.keys
        @data = @orders_grouped_by_site.values

        div do
          render partial: 'admin/orders_chart', locals: { labels: @labels, data: @data }
        end
      end
    end
  end
end
