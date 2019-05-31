Below is the [original README description](#ruby-on-rails-tutorial-sample-application)
outlined by [Michael Hartl](http://www.michaelhartl.com/). There are notable
resolutions that distinguish my sample application from others. I have listed
them to benefit others who may utilize my code as a resource for troubleshooting.
Moreover, I expanded on his sample application with additional components[^1] [^2].

| Issue                                                                                                                       | Resolution                                                                                                                                                                                                                                                                                        |
|-----------------------------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| [Clear input field after dismissing alert box](https://www.railstutorial.org/book/user_microposts#code-jquery_file_test)    | `var micropost_picture = $("#micropost_picture"); micropost_picture.val("");` in _micropost_form.html.erb                                                                                                                                                                                         |
| [_failed_ micropost submission](https://www.railstutorial.org/book/user_microposts#code-microposts_create_action_with_feed) | `<% if @feed_items.any? %> <ol class="microposts"> <%= render @feed_items %> </ol> <%= will_paginate @feed_items %> <% else %> <div class="alert alert-info"> Micropost feed will return after refreshing the page or completing the form with no errors. </div> <% end %>` in the _feed.html.erb |
| site blows up after refresh after a failed micropost submission                                                             | `get '*path', to: redirect('/')` in routes.rb                                                                                                                                                                                                                                                     |
| mobile view non-existent                                                                                                    | `<meta name="viewport" content="width=device-width, initial-scale=1">` in application.html.erb & `@media screen and (min-width: 768px) { body { padding-top: 70px; } }` in application.scss                                                                                                       |

[^1]: Tag cloud inspired by [Bala Paranj](https://rubyplus.com/about).

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

[^2]: Favicon through the installation of the rails_real_favicon gem.
---

# Ruby on Rails Tutorial sample application

This is the sample application for
[*Ruby on Rails Tutorial:
Learn Web Development with Rails*](https://www.railstutorial.org/)
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

If the test suite passes, you'll be ready to run the app in a local server:

```
$ rails s
```

For more information, see the
[*Ruby on Rails Tutorial* book](https://www.railstutorial.org/book).