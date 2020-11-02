## Missives

<div class="posts">
  <ul>
    {% assign posts = site.posts | where_exp: "post", "post.unlisted == nil" %}
    {% assign stories = site.stories %}
    {% assign visiblePosts = posts | concat: stories | sort: 'date' | reverse  %}
    {% for post in visiblePosts %}
      {% if post.story %}
        <li class="story">
          <input type="checkbox" class="toggle" id="{{post.url}}" checked/>
          <strong>{{post.date | date: "%b %d, %Y" }} {{post.kind}}: <label for="{{post.url}}"><b>{{ post.title | upcase }}</b></label></strong>
          <div class="collabsible-content">
            {{post.content}}
          </div>
        </li>
      {% else %}
        <li class="post"><a class="link--post" href="{{ post.url }}">{{ post.title }}</a></li>
      {% endif %}
    {% endfor %}
  </ul>
</div>

