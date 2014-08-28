---
layout: default
title: Technical Musings
---
{% include JB/setup %}

<div class="blog-index">
{% assign page = post %}
{% assign post = site.posts.first %}
{% assign content = post.content %}
{% include post_detail.html %}
</div>
