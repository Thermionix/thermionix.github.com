---
layout: default
title: Technical Musings
---
{% include JB/setup %}

Recent Posts:

<ul class="posts">
 {% for post in site.posts %}
 <li><span>{{ post.date | date_to_string }}</span> &raquo; <a href="{{ BASE_PATH }}{{ post.url }}">{{ post.title }}</a></li>
 {% endfor %}
</ul>

<div class="blog-index">
{% assign page = post %}
{% assign post = site.posts.first %}
{% assign content = post.content %}
{% include post_detail.html %}
</div>
