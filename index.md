# Posts
<ul>
  {% for post in site.posts %}
    <li>
      <span>{{ post.date | date_to_string: "ordinal", "US" }} <a href="{{ post.url }}">{{ post.title }}</a></span>
    </li>
  {% endfor %}
</ul>