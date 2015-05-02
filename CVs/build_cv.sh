#!/bin/bash -xe


SOURCE_DIR=/home/gentux/projects/perso/romain.soufflet.io
CV_DIR=${SOURCE_DIR}/CVs


cat << EOF > ${CV_DIR}/french.html
---
layout: default
description: curriculum vitae (a.k.a CV) in french
title: French Curriculum Vitae
---
  <link rel="stylesheet" href="http://romain.soufflet.io/css/cv.css">
  <div class="container">
    <section>
EOF

pandoc -f markdown -t html ${CV_DIR}/french.md >> ${CV_DIR}/french.html

cat << EOF >> ${CV_DIR}/french.html
    </section>
  </div>
EOF
