Below is the [original README description](#ruby-on-rails-tutorial-sample-application-4th-edition)
outlined by [Michael Hartl](http://www.michaelhartl.com/) outlined in the 4th edition of his book. There are notable
resolutions that distinguish my sample application from others. I have listed
them to benefit others who may utilize my code as a resource for troubleshooting.
Moreover, I expanded on his sample application with additional components
<sup name="1">[1](#myfootnote1)</sup> <sup name="2">[2](#myfootnote2)</sup>.

| Issue                                                                                                                       | Resolution                                                                                                                                                                                                                                                                                        |
|-----------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Clear input field after dismissing alert box](https://www.learnenough.com/ruby-on-rails-4th-edition-tutorial/user_microposts#sec-image_validation)    | `var micropost_picture = $("#micropost_picture"); micropost_picture.val("");` in _micropost_form.html.erb                                                                                                                                                              |
| [_failed_ micropost submission](https://www.learnenough.com/ruby-on-rails-4th-edition-tutorial/user_microposts#sec-a_proto_feed) | `<% if @feed_items.any? %> <ol class="microposts"> <%= render @feed_items %> </ol> <%= will_paginate @feed_items %> <% else %> <div class="alert alert-info"> Others are excited to view your first micropost displayed in your feed! </div> <% end %>` in _feed.html.erb                    |
| | `def create @micropost = current_user.microposts.build(micropost_params) if @micropost.save flash[:success] = "Micropost created!" redirect_to root_path else flash[:danger] = "Micropost was not created successfully" redirect_back(fallback_location: root_path) end end` in microposts_controller.rb                                                                                                                      |
| | `assert_not flash.empty?` on line 18 in microposts_interface_test.rb file for the integration test                                                                                                                                                                                                                                                                                                                            |
| | Deleting the `<%= render 'shared/error_messages', object: f.object %>` atop the _micropost_form.html.erb in the shared folder                                                                                                                                                                                                                                                                                                 |
| site blows up after refresh after a failed micropost submission                                                             | `get '*path', to: redirect('/')` in routes.rb                                                                                                                                                                                                                                                     |
| mobile view non-existent                                                                                                    | `<meta name="viewport" content="width=device-width, initial-scale=1">` in application.html.erb & `@media screen and (min-width: 768px) { body { padding-top: 70px; } }` in application.scss                                                                                                       |

---

# Ruby on Rails Tutorial Sample Application 4th Edition

This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails, 4th edition*](https://www.learnenough.com/ruby-on-rails-4th-edition-tutorial/beginning)
by [Michael Hartl](http://www.michaelhart.com/).

## License

All source code in the [Ruby on Rails Tutorial](https://www.railstutorial.org/)
is available jointly under the MIT License and the Beerware License. See
[License.md](License.md) for details.

## Getting started

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the test suite to verify that everything is working correctly:

```
$ rails test
```

If the test suite passes, you'll be ready to run the app on http://localhost:3000. 

```
$ rails s
```

For more information, see the
[*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).

---

<a name="myfootnote1">1</a>: Tag cloud inspired by [Bala Paranj](https://rubyplus.com/about).  
Referenced [this article](https://rubyplus.com/articles/4241-Tagging-from-Scratch-in-Rails-5).  
Also, includes some seed data for fake tags.
  
```
    list = %w[happy sad angry fun dope humble chill wack nice evil rad puppy]
    list.each { |elem| Tag.create(name: elem) }
    microposts = Micropost.first(100)
    10.times do
        microposts.each do |post|
          rand_tag = Tag.order(Arel.sql('random()')).first
          if post.tag_list.delete(' ').split(',').include?(rand_tag.name)
            next
          else
            new_tagging = post.taggings.build(tag_id: rand_tag.id)
            new_tagging.save if new_tagging.valid?
          end
        end
    end
```
[↩](#1)

<a name="myfootnote2">2</a>: Favicon through the installation of the
rails_real_favicon gem.[↩](#2)

---

## Screenshots

