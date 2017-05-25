Deface::Override.new(virtual_path: "spree/admin/shared/_product_tabs",
                     name: "add_product_video_in_product_tabs",
                     insert_bottom: "[data-hook='admin_product_tabs'], #admin_product_tabs[data-hook]",
                     text: '<li <%== \' class="active"\' if (defined? current and current == "Videos") %>>
                              <%= link_to_with_icon "facetime-video", Spree.t("spree_video.videos"), admin_product_videos_url(@product) %>
                            </li>',
                     disabled: false)
