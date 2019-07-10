## Posts
<ul>
  {% assign postsByYearMonth = site.posts | group_by_exp:"post", "post.date | date: '%Y %B'"  %}
  {% for yearMonth in postsByYearMonth %}
    <h3>{{ yearMonth.name }}</h3>
      <ul>
        {% for post in yearMonth.items %}
          <li><a class="link--post" href="{{ post.url }}">{{ post.title }}</a></li>
        {% endfor %}
      </ul>
  {% endfor %}
</ul>