## Missives

<div class="posts">
  <ul>
    {% assign posts = site.posts | where_exp: "post", "post.unlisted == nil" %}
    {% assign stories = site.stories %}
    {% assign visiblePosts = posts | concat: stories | sort: 'date' | reverse  %}
    {% for post in visiblePosts %}
      {% if post.story %}
        <li class="story">
          {{post.date | date: "%b %d, %Y" }} {{post.kind}}: <a href="{{ post.url }}"><b>{{ post.title | upcase }}</b></a>
          {{post.content | trim}}
        </li>
      {% else %}
        <li><a class="link--post" href="{{ post.url }}">{{ post.title }}</a></li>
      {% endif %}
    {% endfor %}
  </ul>
</div>
