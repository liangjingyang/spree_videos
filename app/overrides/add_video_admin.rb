Deface::Override.new(virtual_path: "spree/admin/shared/_product_tabs",
                     name: "add_product_video_in_product_tabs",
                     insert_bottom: "[data-hook='admin_product_tabs'], #admin_product_tabs[data-hook]",
                     text: '<li <%== \' class="active"\' if (defined? current and current == "Videos") %>>
                                <% if @product.videos.any? %>
                                    <%= link_to_with_icon "video", Spree.t(:videos_count, count: @product.videos.count), admin_product_videos_url(@product) %>
                                <% else %>
                                    <%= link_to_with_icon "video", Spree.t(:videos), admin_product_videos_url(@product) %>
                                <% end %>
                            </li>',
                     disabled: false)
