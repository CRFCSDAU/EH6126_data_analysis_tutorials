---
title: "Crossover Trials"
output: 
  html_document:
    keep_md: true
---

# Crossover trials

For this tutorial we will be working with a dataset from a standard 2 period, 2 intervention AB:BA crossover trial of a treatment aimed at lowering blood pressure in people who usually have mildly-evaluated values. In other words, each person in the trial gets exposured to each intervention (active vs placebo), but in one of two possible sequences (active first vs placebo first). 

As usual, we will first load the neccessary packages and bring in the dataset. 



Have a look at the dataset. 


```r
# View(data)
```



```r
  print(summarytools::dfSummary(data, style = "grid", plain.ascii = FALSE), 
    method = "render")
```

<!--html_preserve--><div class="container st-container">
<h3>Data Frame Summary</h3>
<h4>data</h4>
<strong>Dimensions</strong>: 83 x 17
  <br/><strong>Duplicates</strong>: 0
<br/>
<table class="table table-striped table-bordered st-table st-table-striped st-table-bordered st-multiline ">
  <thead>
    <tr>
      <th align="center" class="no st-protect-top-border"><strong>No</strong></th>
      <th align="center" class="variable st-protect-top-border"><strong>Variable</strong></th>
      <th align="center" class="stats.values st-protect-top-border"><strong>Stats / Values</strong></th>
      <th align="center" class="freqs.pct.valid st-protect-top-border"><strong>Freqs (% of Valid)</strong></th>
      <th align="center" class="graph st-protect-top-border"><strong>Graph</strong></th>
      <th align="center" class="valid st-protect-top-border"><strong>Valid</strong></th>
      <th align="center" class="missing st-protect-top-border"><strong>Missing</strong></th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td align="center">1</td>
      <td align="left">subj_id
[character]</td>
      <td align="left">1. R001
2. R002
3. R003
4. R004
5. R005
6. R006
7. R007
8. R008
9. R009
10. R010
[ 73 others ]</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">1.2%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">1.2%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">1.2%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">1.2%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">1.2%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">1.2%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">1.2%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">1.2%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">1.2%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">1.2%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 5px 0 7px;margin:0;border:0" align="right">73</td><td style="padding:0 2px 0 0;border:0;" align="left">(</td><td style="padding:0;border:0" align="right">87.9%</td><td style="padding:0 4px 0 2px;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJAAAAESBAMAAADgZ0HsAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAALZJREFUeNrt1cENwkAMBMC0kBIIHUD/vfGBJyHShZXPmS1gHl7JuyxyJNttHcwbuoNAIBDo39BpP3uUuQJkIEEgEGgeyEAGb1SvfhAIBGoH2bUgZCBBIBBoHshABm9Ur34QCARqB9m14I3q1Q8CgUCgb5CBDN6oXv0gEAjUDrJrwRvVqx8EAoHaQXYtCBlIEAgEmgcykMEb1asfBAKB2kF2LQhtw/nU/xzMAwQCgUA/oNN+tuznBcZ8WB+HO60AAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE5LTEwLTMxVDA3OjE5OjQ2KzAwOjAw6/UlzgAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxOS0xMC0zMVQwNzoxOTo0NiswMDowMJqonXIAAAAASUVORK5CYII="></td>
      <td align="center">83
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">2</td>
      <td align="left">sequence
[numeric]</td>
      <td align="left">Min : 0
Mean : 0.5
Max : 1</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 0 0 7px;margin:0;border:0" align="right">0</td><td style="padding:0 2px;border:0;" align="left">:</td><td style="padding:0 4px 0 6px;margin:0;border:0" align="right">42</td><td style="padding:0;border:0" align="left">(</td><td style="padding:0 2px;margin:0;border:0" align="right">50.6%</td><td style="padding:0 4px 0 0;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 0 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px;border:0;" align="left">:</td><td style="padding:0 4px 0 6px;margin:0;border:0" align="right">41</td><td style="padding:0;border:0" align="left">(</td><td style="padding:0 2px;margin:0;border:0" align="right">49.4%</td><td style="padding:0 4px 0 0;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAFgAAAA4BAMAAACLTyJdAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAADtJREFUSMdjYBiaQIkoAFWsbEwEMBpVPKp4VDGtFJOUYQWJAoNLMVH+UyQl6EYVjyoeVUwzxSRl2KEGAC/KSSrrn0bWAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE5LTEwLTMxVDA3OjE5OjQ2KzAwOjAw6/UlzgAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxOS0xMC0zMVQwNzoxOTo0NiswMDowMJqonXIAAAAASUVORK5CYII="></td>
      <td align="center">83
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">3</td>
      <td align="left">treatment_p1
[numeric]</td>
      <td align="left">Min : 0
Mean : 0.5
Max : 1</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 0 0 7px;margin:0;border:0" align="right">0</td><td style="padding:0 2px;border:0;" align="left">:</td><td style="padding:0 4px 0 6px;margin:0;border:0" align="right">42</td><td style="padding:0;border:0" align="left">(</td><td style="padding:0 2px;margin:0;border:0" align="right">50.6%</td><td style="padding:0 4px 0 0;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 0 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px;border:0;" align="left">:</td><td style="padding:0 4px 0 6px;margin:0;border:0" align="right">41</td><td style="padding:0;border:0" align="left">(</td><td style="padding:0 2px;margin:0;border:0" align="right">49.4%</td><td style="padding:0 4px 0 0;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAFgAAAA4BAMAAACLTyJdAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAADtJREFUSMdjYBiaQIkoAFWsbEwEMBpVPKp4VDGtFJOUYQWJAoNLMVH+UyQl6EYVjyoeVUwzxSRl2KEGAC/KSSrrn0bWAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE5LTEwLTMxVDA3OjE5OjQ2KzAwOjAw6/UlzgAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxOS0xMC0zMVQwNzoxOTo0NiswMDowMJqonXIAAAAASUVORK5CYII="></td>
      <td align="center">83
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">4</td>
      <td align="left">treatment_p2
[numeric]</td>
      <td align="left">Min : 0
Mean : 0.5
Max : 1</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 0 0 7px;margin:0;border:0" align="right">0</td><td style="padding:0 2px;border:0;" align="left">:</td><td style="padding:0 4px 0 6px;margin:0;border:0" align="right">41</td><td style="padding:0;border:0" align="left">(</td><td style="padding:0 2px;margin:0;border:0" align="right">49.4%</td><td style="padding:0 4px 0 0;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 0 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px;border:0;" align="left">:</td><td style="padding:0 4px 0 6px;margin:0;border:0" align="right">42</td><td style="padding:0;border:0" align="left">(</td><td style="padding:0 2px;margin:0;border:0" align="right">50.6%</td><td style="padding:0 4px 0 0;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAFgAAAA4BAMAAACLTyJdAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAADxJREFUSMdjYBiaQIkYoAhVrGxMBBhVPKp4VDHNFJOUYQWJAoNLMVEeVCIl6IxGFY8qHlVMK8UkZdihBgAUZEkqMlG4MQAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAxOS0xMC0zMVQwNzoxOTo0NiswMDowMOv1Jc4AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTktMTAtMzFUMDc6MTk6NDYrMDA6MDCaqJ1yAAAAAElFTkSuQmCC"></td>
      <td align="center">83
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">5</td>
      <td align="left">sex
[numeric]</td>
      <td align="left">Min : 0
Mean : 0.4
Max : 1</td>
      <td align="left" style="padding:0;vertical-align:middle"><table style="border-collapse:collapse;border:none;margin:0"><tr style="background-color:transparent"><td style="padding:0 0 0 7px;margin:0;border:0" align="right">0</td><td style="padding:0 2px;border:0;" align="left">:</td><td style="padding:0 4px 0 6px;margin:0;border:0" align="right">46</td><td style="padding:0;border:0" align="left">(</td><td style="padding:0 2px;margin:0;border:0" align="right">55.4%</td><td style="padding:0 4px 0 0;border:0" align="left">)</td></tr><tr style="background-color:transparent"><td style="padding:0 0 0 7px;margin:0;border:0" align="right">1</td><td style="padding:0 2px;border:0;" align="left">:</td><td style="padding:0 4px 0 6px;margin:0;border:0" align="right">37</td><td style="padding:0;border:0" align="left">(</td><td style="padding:0 2px;margin:0;border:0" align="right">44.6%</td><td style="padding:0 4px 0 0;border:0" align="left">)</td></tr></table></td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAGAAAAA4BAMAAADwa+CRAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqb39/f///+DdZCQAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAAD5JREFUSMdjYBgeQIloANWgbEwkMBrVMKphVMNQ0EByISBINBi8Ggj6VRFNA8FgHdUwqmFUw5DSQHIhMNQBAMlRVeqKXNlIAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE5LTEwLTMxVDA3OjE5OjQ2KzAwOjAw6/UlzgAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxOS0xMC0zMVQwNzoxOTo0NiswMDowMJqonXIAAAAASUVORK5CYII="></td>
      <td align="center">83
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">6</td>
      <td align="left">age_screening
[numeric]</td>
      <td align="left">Mean (sd) : 57.7 (6.2)
min < med < max:
45 < 57 < 70
IQR (CV) : 10.5 (0.1)</td>
      <td align="left" style="vertical-align:middle">25 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAAHBJREFUaN7t1MsJgDAQQMG0YAuxA9N/b15dhMV8EMF5t0B2yCFsKRppS6qh7OYDbG+XDhjsDSz7wt1YS94Jg8FgX8PiApzEwniDwWCw32LJbu3HknEYDAaD9WJxQ09i8QSDwWAwGAwGg8HuWF1S0UgnVepv7B3eQQYAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTktMTAtMzFUMDc6MTk6NDYrMDA6MDDr9SXOAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE5LTEwLTMxVDA3OjE5OjQ2KzAwOjAwmqidcgAAAABJRU5ErkJggg=="></td>
      <td align="center">83
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">7</td>
      <td align="left">days_p1
[numeric]</td>
      <td align="left">Mean (sd) : 42.4 (4.7)
min < med < max:
34 < 42 < 68
IQR (CV) : 1 (0.1)</td>
      <td align="left" style="vertical-align:middle">19 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAAH1JREFUaN7t2bENgCAQQFFW0A2EDWT/3WyQAmNyQQqL9xsL4ouQYHMpaaZtbM+tY4v3itUWDAaDwWAwGAwGg8FgMBgMBoPBYDAY7Indg5m8AivtecaxPE6GvmBlPKL/YX2/K7D+LgwWxQI3Po7Vt0/sE9+8Ausr41/jU0kzXXeQgRDkVJrYAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE5LTEwLTMxVDA3OjE5OjQ2KzAwOjAw6/UlzgAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxOS0xMC0zMVQwNzoxOTo0NiswMDowMJqonXIAAAAASUVORK5CYII="></td>
      <td align="center">83
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">8</td>
      <td align="left">days_p2
[numeric]</td>
      <td align="left">Mean (sd) : 42.7 (3.4)
min < med < max:
33 < 42 < 50
IQR (CV) : 2 (0.1)</td>
      <td align="left" style="vertical-align:middle">17 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAAIxJREFUaN7t2M0NgCAMhmFW0A2EDez+u5kYeqABf7BGo+93JOWhSXsiBNKTYTsxZ6fsGJZkzQwGBgYGBgYGBgYGBgYGBgYGBgYGBvYhzPwk24/lc5iUHdqGwf6D6SK5YLlawF6GmSHr0PuwxnEdG8unL2JlNdjtmG7K5IHpLVdMO3TBUrX6SSy6JJCeLLtyteWn755XAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE5LTEwLTMxVDA3OjE5OjQ2KzAwOjAw6/UlzgAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxOS0xMC0zMVQwNzoxOTo0NiswMDowMJqonXIAAAAASUVORK5CYII="></td>
      <td align="center">82
(98.8%)</td>
      <td align="center">1
(1.2%)</td>
    </tr>
    <tr>
      <td align="center">9</td>
      <td align="left">height_m
[numeric]</td>
      <td align="left">Mean (sd) : 1.7 (0.1)
min < med < max:
1.5 < 1.7 < 1.9
IQR (CV) : 0.2 (0.1)</td>
      <td align="left" style="vertical-align:middle">34 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAAJNJREFUaN7t2UEKgCAQhWGvYDdoukHe/24t9BFKG0cpg/9txEG/jQqWIRBPYlc2y9mbug9LOWBgYP1YOYs2BTvy5BPsZUyrKEx9F1aQJCzVLRgYGBgYGBjYb7DmqjuGqQwW7y/6OVg9GgwMDAwMDAxsIczqh4wxTLPAPsaaf6dj2PE4GmxxTHtgCqYymBuzKQnEkwsEPsVg7EbpQwAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAxOS0xMC0zMVQwNzoxOTo0NiswMDowMOv1Jc4AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTktMTAtMzFUMDc6MTk6NDYrMDA6MDCaqJ1yAAAAAElFTkSuQmCC"></td>
      <td align="center">83
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">10</td>
      <td align="left">weight_kg_screen
[numeric]</td>
      <td align="left">Mean (sd) : 80.4 (13)
min < med < max:
53.5 < 80.9 < 106.3
IQR (CV) : 20.4 (0.2)</td>
      <td align="left" style="vertical-align:middle">76 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAAKlJREFUaN7t2NENgCAMRVFW0A2EDXT/3YzUxIpSBYmJ8b5PS0/8aIDgHKlJd5nex5hr7mPTkhEMLEZma2iDhSiAgb2NmVtkKWb+H9gfMDlzTUztnFdY7DIxVQQDK8XWK6KJpROdx1RXDkuLYD/F1OA9x0LKgIGBgYGBgYGBfRA7XBFvYPo9Z4eF8/UmJkUwsExRpq0RJp/BwGzMbw8yz7FMFxiYbxJHajIDVcPmRg/VwyEAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTktMTAtMzFUMDc6MTk6NDYrMDA6MDDr9SXOAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE5LTEwLTMxVDA3OjE5OjQ2KzAwOjAwmqidcgAAAABJRU5ErkJggg=="></td>
      <td align="center">83
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">11</td>
      <td align="left">bmi_screening
[numeric]</td>
      <td align="left">Mean (sd) : 27.7 (3.5)
min < med < max:
20.4 < 27.9 < 37.2
IQR (CV) : 4.9 (0.1)</td>
      <td align="left" style="vertical-align:middle">83 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAAI5JREFUaN7t2FEKgCAQRVG3UDvIdpD731sQMx8KaekUlvf9COIcRBhBnSM1mfLxksKya9gajmxgYGBgL2J6j5lgggQwsLGwOW6jRixGwMDAwHrACs+ee1jI73BMTE/YBEuqwMB+g0mfLCaYjGBgYGBgYGB9YelPZRN2UgX2FKYfZN4E02kwsK9i3iSO1GQHZ6ySJfehWDoAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTktMTAtMzFUMDc6MTk6NDYrMDA6MDDr9SXOAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE5LTEwLTMxVDA3OjE5OjQ2KzAwOjAwmqidcgAAAABJRU5ErkJggg=="></td>
      <td align="center">83
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">12</td>
      <td align="left">sbpscreening
[numeric]</td>
      <td align="left">Mean (sd) : 140.4 (10.1)
min < med < max:
124 < 140 < 171
IQR (CV) : 13.5 (0.1)</td>
      <td align="left" style="vertical-align:middle">35 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAAJZJREFUaN7t2EEKgCAQQFGvYDdovEHe/26RuhgXYo7mIv5fDswjCENyjiz5Voek/Ku6WHy6wDZi5QWea7C0H8HAwJZh+YTKGixkBgwMzIQd6jjOY2ofDAzsI0xfc6exPAIDAwP7C9b7RA5hofN8YGBgYGBgYGAbsOo/6ghWXYwK1tzsYdUIbAsmumpkwEJzBGbGZEmOLN15Amt4meYYrgAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAxOS0xMC0zMVQwNzoxOTo0NiswMDowMOv1Jc4AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTktMTAtMzFUMDc6MTk6NDYrMDA6MDCaqJ1yAAAAAElFTkSuQmCC"></td>
      <td align="center">83
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">13</td>
      <td align="left">dbpscreening
[numeric]</td>
      <td align="left">Mean (sd) : 89.5 (8.8)
min < med < max:
67 < 89 < 112
IQR (CV) : 11.5 (0.1)</td>
      <td align="left" style="vertical-align:middle">34 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAAI5JREFUaN7t1sEJwCAMQFFXcAW7Qd1/t1L0EghRU1so+f/i7ZGDRFMiT9motPK4CeyodycYGBgY2NvYxPaex+p4QDAwMDCwRawv6j1YUyoY2M8x6/+yjFkDgoGBRcXE6/sUE0poTN3eXkwdEAwMDAzsW0x7MN2YpoCBbcOM22piRdQxQzExecTCypYSeboAx7k/oE1/GMcAAAAldEVYdGRhdGU6Y3JlYXRlADIwMTktMTAtMzFUMDc6MTk6NDYrMDA6MDDr9SXOAAAAJXRFWHRkYXRlOm1vZGlmeQAyMDE5LTEwLTMxVDA3OjE5OjQ2KzAwOjAwmqidcgAAAABJRU5ErkJggg=="></td>
      <td align="center">83
(100%)</td>
      <td align="center">0
(0%)</td>
    </tr>
    <tr>
      <td align="center">14</td>
      <td align="left">sbp__b_p1
[numeric]</td>
      <td align="left">Mean (sd) : 137.4 (12.6)
min < med < max:
109 < 137.5 < 167
IQR (CV) : 13.8 (0.1)</td>
      <td align="left" style="vertical-align:middle">38 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAAIFJREFUaN7t1rENgDAMBdGswAphA7z/bjQobswXMS4guqtSRE9uErk1yrTJ+kjfe4TtdnWAgYGBgYGBrYDpRWESMzkjGBjYDebvsAAbhIGBgYG9x6JFIY1FM4KBgYGBgf0ACxb2PBYQYGBgYKWYf1oFmJ8+j8nPehaTxDpYL6lRphNAZ3V88/Og/AAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAxOS0xMC0zMVQwNzoxOTo0NiswMDowMOv1Jc4AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTktMTAtMzFUMDc6MTk6NDYrMDA6MDCaqJ1yAAAAAElFTkSuQmCC"></td>
      <td align="center">82
(98.8%)</td>
      <td align="center">1
(1.2%)</td>
    </tr>
    <tr>
      <td align="center">15</td>
      <td align="left">sbp__ep_p1
[numeric]</td>
      <td align="left">Mean (sd) : 137.1 (14.5)
min < med < max:
106 < 136 < 178
IQR (CV) : 16.8 (0.1)</td>
      <td align="left" style="vertical-align:middle">44 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAAI1JREFUaN7t2MEJwCAMQFFXsBtUN2j2362HNrmIWmKgCP+fiuJDehFNiTzlbkXL86ZYlacLDAwMDAzMgR16KBn24ZjqYq8hhsl8i2BgYGBgYGBgYGBgYFtjeoc6IzD9AANzY3atj8CatWBg/2Lts9UCZjP7YKV5yFvAanctmA7YD4/AbAYMbIyVkBJ5ugG2qG8uBc3pqgAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAxOS0xMC0zMVQwNzoxOTo0NiswMDowMOv1Jc4AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTktMTAtMzFUMDc6MTk6NDYrMDA6MDCaqJ1yAAAAAElFTkSuQmCC"></td>
      <td align="center">82
(98.8%)</td>
      <td align="center">1
(1.2%)</td>
    </tr>
    <tr>
      <td align="center">16</td>
      <td align="left">sbp__b_p2
[numeric]</td>
      <td align="left">Mean (sd) : 135.5 (12.3)
min < med < max:
112 < 135 < 170
IQR (CV) : 17.8 (0.1)</td>
      <td align="left" style="vertical-align:middle">38 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAAHtJREFUaN7t1rsVgCAQRNFtATsQO3D7781MJ1D5rIHoexGB3ENgMGbUUzovS6ncPbb43goGBgYGBgY2EjbJJIhjB+A/xCrmVT3m5VeCgYGBgYGBgY2G6V4KYxe3wMAaMfkr5zAmZzAwMDAwMLAvYDpgw5h+8nosP5JRTxu8ksD5moHWjwAAACV0RVh0ZGF0ZTpjcmVhdGUAMjAxOS0xMC0zMVQwNzoxOTo0NiswMDowMOv1Jc4AAAAldEVYdGRhdGU6bW9kaWZ5ADIwMTktMTAtMzFUMDc6MTk6NDYrMDA6MDCaqJ1yAAAAAElFTkSuQmCC"></td>
      <td align="center">82
(98.8%)</td>
      <td align="center">1
(1.2%)</td>
    </tr>
    <tr>
      <td align="center">17</td>
      <td align="left">sbp__ep_p2
[numeric]</td>
      <td align="left">Mean (sd) : 136.4 (14)
min < med < max:
104 < 133 < 174
IQR (CV) : 19.8 (0.1)</td>
      <td align="left" style="vertical-align:middle">42 distinct values</td>
      <td align="left" style="vertical-align:middle;padding:0;background-color:transparent"><img style="border:none;background-color:transparent;padding:0" src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAJgAAABuBAMAAAApJ8cWAAAABGdBTUEAALGPC/xhBQAAACBjSFJNAAB6JgAAgIQAAPoAAACA6AAAdTAAAOpgAAA6mAAAF3CculE8AAAAD1BMVEX////9/v2mpqby8vL///8shn5hAAAAAnRSTlMAAHaTzTgAAAABYktHRACIBR1IAAAAB3RJTUUH4wofBxMuprjGPAAAAIlJREFUaN7t2MEJwCAMQFFXsBtUN6j779aLyaFBkJhSof+fRMm7SYspkaf87Ci9M883xFoPDAxsb0xvfonAZOMCAwMDA/sLpt+RCKyKAQYGBgYGBgYG9gVm/u1WMDMLFoGNX3AdmCzAwMDCMPvWuoDpCRgY2GuYXloPpsMdq8PZCUxPtsdKSIk83e1BX0n+ijYaAAAAJXRFWHRkYXRlOmNyZWF0ZQAyMDE5LTEwLTMxVDA3OjE5OjQ2KzAwOjAw6/UlzgAAACV0RVh0ZGF0ZTptb2RpZnkAMjAxOS0xMC0zMVQwNzoxOTo0NiswMDowMJqonXIAAAAASUVORK5CYII="></td>
      <td align="center">82
(98.8%)</td>
      <td align="center">1
(1.2%)</td>
    </tr>
  </tbody>
</table>
<p>Generated by <a href='https://github.com/dcomtois/summarytools'>summarytools</a> 0.9.3 (<a href='https://www.r-project.org/'>R</a> version 3.6.0)<br/>2019-10-31</p>
</div><!--/html_preserve-->

We can see there are 4 SBP values per patient (row). These are the start and end values for each of the two periods. To visualize and analyze these data correctly, we need to convert the dataset so that it's "long", i.e. one row for each time point


```r
# Reshape the data on 4 SBP values in order to plot the within period changes
# by tx group, get missing values. See functions.R

  data_long <- gather(data, time, value, starts_with("sbp")) %>%
    select(sequence, treatment_p1, treatment_p2, time, value, subj_id, sex, 
           everything()) %>%
    mutate(sequence = factor(sequence), treatment_p1 = factor(treatment_p1),
           treatment_p2 = factor(treatment_p2))

# view(dfSummary(data_long))
```

Now you can see there are five timepoints (screening, plus the start and end values for each of the two periods), each with 83 observations, which is the number of study participants. 

Now let's clean up the data a bit. 


```r
  data_long$time <- gsub("sbp__|sbp", "", data_long$time) # remove extraneous info

# Just reordering the levels so they mactch time. This will help when we plot
# the data. 
  times <- c("b_p1", "ep_p1", "b_p2", "ep_p2")

  data_long <- mutate(data_long, time = factor(time, levels = times)) 
# table(data_long$time)

# Create a new variable to reflect the period  
  data_long$period[grepl("_p1", data_long$time)] <- "First"
  data_long$period[grepl("_p2", data_long$time)] <- "Second"

# Create a new variable to reflect start (baseline) or end of period  
  bp <- grepl("b_p",  data_long$time) # Baseline times
  ep <- grepl("ep_p", data_long$time) # End times

  data_long$timing[bp] <- "Baseline"
  data_long$timing[ep] <- "EoP"
  
# with(data_long, table(period, timing))  

# These are the same info but we'll use them in the models below where I'll 
# explain why we want them split into 2 columns like this.   
  data_long$bl[bp] <- data_long$value[bp] # Baseline SBPs
  data_long$ep[ep] <- data_long$value[ep] # End SBPs

# Treatment indicator  
  p1 <- data_long$period == "First"  & !is.na(data_long$period)
  p2 <- data_long$period == "Second" & !is.na(data_long$period)
  data_long$tx[p1] <- data_long$treatment_p1[p1]
  data_long$tx[p2] <- data_long$treatment_p2[p2]

  data_long <- filter(data_long, !is.na(time)) %>%
    arrange(subj_id, period, timing) %>%
    select(subj_id, sequence, period, timing, tx, value, everything()) %>%
    mutate(period = factor(period),
           timing = factor(timing),
           tx  = factor(tx))

  data_long$time2 <- factor(data_long$time, labels = c("p1_b", "p1_ep",
                                         "p2_b", "p2_ep"))

# View(data_long)
  
# view(dfSummary(data_long))
```


```r
  ggplot(data_long, aes(x = time2, y = value, group = subj_id)) +
    geom_line(data = filter(data_long, as.numeric(time) < 3), alpha = 0.2,
              aes(color = treatment_p1)) +
    geom_smooth(data = filter(data_long, as.numeric(time) < 3), method = "lm",
                aes(color = treatment_p1, linetype = treatment_p1,
                group = treatment_p1),
                se = FALSE, size = 2) +
    geom_line(data = filter(data_long, as.numeric(time) > 2), alpha = 0.2,
              aes(color = treatment_p2)) +
    geom_smooth(data = filter(data_long, as.numeric(time) > 2), method = "lm",
                aes(color = treatment_p2, linetype = treatment_p2,
                    group = treatment_p2),
                se = FALSE, size = 2) +
    scale_linetype(guide = FALSE) +
    theme_minimal() +
    scale_color_brewer("Tx", palette = "Set1") +
    theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
    scale_x_discrete(labels = c("Start P1", "End P1", "Start P2", "End P2")) +
    xlab("") +
    ylab("SBP mmHg")
```

![](Crossover_trials_files/figure-html/cross_over_plot-1.png)<!-- -->


```r
# Distribution plot

  ggplot(data_long, aes(x = value, fill = tx, color = tx)) +
    geom_density(alpha = 0.7) +
    geom_rug() +
    scale_fill_brewer("Tx", palette = "Set1") +
    scale_color_brewer("Tx", palette = "Set1") +
    facet_wrap(~period + timing) +
    theme_minimal() +
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank()) +
    ylab("") +
    xlab("SBP mmHg")
```

![](Crossover_trials_files/figure-html/distribution_plot-1.png)<!-- -->

## Modelling

Now we can model the effect of the treatment, though I suspect that you already have some idea of what it might be! Below, we'll use a set of models to make different adjustments for things like prognostic covariates (sex), period specific effects, and period-specific baseline (start) values. 


```r
# Models

# Re-configure the data so we can adjust for period-specific baselines if we
# want to. 

  me_sbp_df <- full_join(
    select(data_long, subj_id, sex, period, bl, tx) %>% filter(!is.na(bl)),
    select(data_long, subj_id, sex, period, ep, tx) %>% filter(!is.na(ep)),
    by = c("subj_id", "period", "tx", "sex")
  ) %>%
    mutate(bl = scale(bl, scale = FALSE))


# 4 models. Adjust for sex; + period; +tx*period interaction; +bl
  me_sbp     <- lmer(ep ~ tx + sex +               (1 | subj_id),
                     data = me_sbp_df)
  me_sbp_p   <- lmer(ep ~ tx + sex + period +      (1 | subj_id),
                     data = me_sbp_df)
  me_sbp_int <- lmer(ep ~ tx * period +  sex +     (1 | subj_id),
                     data = me_sbp_df)
  me_sbp_bl  <- lmer(ep ~ tx + sex + period + bl + (1 | subj_id),
                     data = me_sbp_df)

  labs <- c("Intercept", "Treatment", "Sex", "Period")

  tab_model(
    me_sbp, me_sbp_p, me_sbp_bl,
    p.val = "kr",
    file = "table_me_sbp.html",
    pred.labels = c(labs, "SBP Baseline"),
    dv.labels = c("Unadjusted", "+ Period effect", "+ Baselines")
    )
```

<table style="border-collapse:collapse; border:none;">
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Unadjusted</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">+ Period effect</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">+ Baselines</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  col7">p</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  col8">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  col9">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  0">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Intercept</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">137.79</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">133.78&nbsp;&ndash;&nbsp;141.80</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">138.21</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">134.03&nbsp;&ndash;&nbsp;142.40</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7"><strong>&lt;0.001</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col8">136.18</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col9">132.98&nbsp;&ndash;&nbsp;139.39</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  0"><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Treatment</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.24</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-2.12&nbsp;&ndash;&nbsp;2.61</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.840</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.25</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-2.12&nbsp;&ndash;&nbsp;2.63</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">0.834</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col8">-0.08</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col9">-2.92&nbsp;&ndash;&nbsp;2.77</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  0">0.957</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Sex</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-2.94</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-8.67&nbsp;&ndash;&nbsp;2.79</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.317</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-2.96</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-8.69&nbsp;&ndash;&nbsp;2.77</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">0.315</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col8">0.80</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col9">-2.94&nbsp;&ndash;&nbsp;4.53</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  0">0.677</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Period</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.84</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-3.21&nbsp;&ndash;&nbsp;1.54</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">0.491</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col8">0.51</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col9">-2.35&nbsp;&ndash;&nbsp;3.37</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  0">0.726</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">SBP Baseline</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7"></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col8">0.71</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col9">0.57&nbsp;&ndash;&nbsp;0.85</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  0"><strong>&lt;0.001</td>
</tr>
<tr>
<td colspan="10" style="font-weight:bold; text-align:left; padding-top:.8em;">Random Effects</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">&sigma;<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">59.31</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">59.68</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">85.50</td>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">&tau;<sub>00</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">144.89 <sub>subj_id</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">144.76 <sub>subj_id</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">27.63 <sub>subj_id</sub></td>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">ICC</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.71</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.71</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.24</td>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">83 <sub>subj_id</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">83 <sub>subj_id</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">83 <sub>subj_id</sub></td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">164</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">164</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">163</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.010 / 0.713</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.011 / 0.711</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.404 / 0.549</td>
</tr>

</table>

So that confirms what we probably should have expected from the plotting, which is that there was no appreciable effect on the outcome. But just for fun, now we will add an effect. We are going to make is pretty big, equal to -10 mmHg (almost a full SD of the observed SBP values), and add it to the active tx values. 


```r
  effect <- -3

  data_long$value_2 <- data_long$value

  tar <- data_long$tx == 2 & data_long$timing == "EoP"

  data_long$value_2[tar] <- data_long$value_2[tar] + effect
  
  data_long$ep_2 <- data_long$ep
  
  data_long$ep_2[tar] <- data_long$ep_2[tar] + effect
```

Now just repeat everything we did before, replacing value_2 for value. 
 

```r
  ggplot(data_long, aes(x = time2, y = value_2, group = subj_id)) +
    geom_line(data = filter(data_long, as.numeric(time) < 3), alpha = 0.2,
              aes(color = treatment_p1)) +
    geom_smooth(data = filter(data_long, as.numeric(time) < 3), method = "lm",
                aes(color = treatment_p1, linetype = treatment_p1,
                group = treatment_p1),
                se = FALSE, size = 2) +
    geom_line(data = filter(data_long, as.numeric(time) > 2), alpha = 0.2,
              aes(color = treatment_p2)) +
    geom_smooth(data = filter(data_long, as.numeric(time) > 2), method = "lm",
                aes(color = treatment_p2, linetype = treatment_p2,
                    group = treatment_p2),
                se = FALSE, size = 2) +
    scale_linetype(guide = FALSE) +
    theme_minimal() +
    scale_color_brewer("Tx", palette = "Set1") +
    theme(panel.grid.major = element_blank(),
        panel.grid.minor = element_blank()) +
    scale_x_discrete(labels = c("Start P1", "End P1", "Start P2", "End P2")) +
    xlab("") +
    ylab("SBP mmHg")
```

![](Crossover_trials_files/figure-html/cross_over_plot_2-1.png)<!-- -->



```r
  ggplot(data_long, aes(x = value_2, fill = tx, color = tx)) +
    geom_density(alpha = 0.7) +
    geom_rug() +
    scale_fill_brewer("Tx", palette = "Set1") +
    scale_color_brewer("Tx", palette = "Set1") +
    facet_wrap(~period + timing) +
    theme_minimal() +
    theme(panel.grid.major = element_blank(),
          panel.grid.minor = element_blank()) +
    ylab("") +
    xlab("SBP mmHg")
```

![](Crossover_trials_files/figure-html/distribution_plot_2-1.png)<!-- -->



```r
# Models

# Re-configure the data so we can adjust for period-specific baselines if we
# want to. 

  me_sbp_df <- full_join(
    select(data_long, subj_id, sex, period, bl, tx) %>%   filter(!is.na(bl)),
    select(data_long, subj_id, sex, period, ep_2, tx) %>% filter(!is.na(ep_2)),
    by = c("subj_id", "period", "tx", "sex")
  ) %>%
    mutate(bl = scale(bl, scale = FALSE))


# 4 models. Adjust for sex; + period; +tx*period interaction; +bl
  me_sbp     <- lmer(ep_2 ~ tx + sex +               (1 | subj_id),
                     data = me_sbp_df)
  me_sbp_p   <- lmer(ep_2 ~ tx + sex + period +      (1 | subj_id),
                     data = me_sbp_df)
  me_sbp_int <- lmer(ep_2 ~ tx * period +  sex +     (1 | subj_id),
                     data = me_sbp_df)
  me_sbp_bl  <- lmer(ep_2 ~ tx + sex + period + bl + (1 | subj_id),
                     data = me_sbp_df)

  labs <- c("Intercept", "Treatment", "Sex", "Period")

  tab_model(
    me_sbp, me_sbp_p, me_sbp_bl,
    p.val = "kr",
    file = "table_me_sbp.html",
    pred.labels = c(labs, "SBP Baseline"),
    dv.labels = c("Unadjusted", "+ Period effect", "+ Baselines")
    )
```

<table style="border-collapse:collapse; border:none;">
<tr>
<th style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm;  text-align:left; ">&nbsp;</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">Unadjusted</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">+ Period effect</th>
<th colspan="3" style="border-top: double; text-align:center; font-style:normal; font-weight:bold; padding:0.2cm; ">+ Baselines</th>
</tr>
<tr>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  text-align:left; ">Predictors</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">p</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  ">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  col7">p</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  col8">Estimates</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  col9">CI</td>
<td style=" text-align:center; border-bottom:1px solid; font-style:italic; font-weight:normal;  0">p</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Intercept</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">137.79</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">133.78&nbsp;&ndash;&nbsp;141.80</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>&lt;0.001</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">138.21</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">134.03&nbsp;&ndash;&nbsp;142.40</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7"><strong>&lt;0.001</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col8">136.18</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col9">132.98&nbsp;&ndash;&nbsp;139.39</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  0"><strong>&lt;0.001</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Treatment</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-2.76</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-5.12&nbsp;&ndash;&nbsp;-0.39</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "><strong>0.025</strong></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-2.75</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-5.12&nbsp;&ndash;&nbsp;-0.37</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7"><strong>0.026</strong></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col8">-3.08</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col9">-5.92&nbsp;&ndash;&nbsp;-0.23</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  0"><strong>0.037</strong></td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Sex</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-2.94</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-8.67&nbsp;&ndash;&nbsp;2.79</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">0.317</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-2.96</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-8.69&nbsp;&ndash;&nbsp;2.77</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">0.315</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col8">0.80</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col9">-2.94&nbsp;&ndash;&nbsp;4.53</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  0">0.677</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">Period</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-0.84</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  ">-3.21&nbsp;&ndash;&nbsp;1.54</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7">0.491</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col8">0.51</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col9">-2.35&nbsp;&ndash;&nbsp;3.37</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  0">0.726</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; ">SBP Baseline</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  "></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col7"></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col8">0.71</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  col9">0.57&nbsp;&ndash;&nbsp;0.85</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:center;  0"><strong>&lt;0.001</td>
</tr>
<tr>
<td colspan="10" style="font-weight:bold; text-align:left; padding-top:.8em;">Random Effects</td>
</tr>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">&sigma;<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">59.31</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">59.68</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">85.50</td>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">&tau;<sub>00</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">144.89 <sub>subj_id</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">144.76 <sub>subj_id</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">27.63 <sub>subj_id</sub></td>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">ICC</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.71</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.71</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.24</td>

<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">N</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">83 <sub>subj_id</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">83 <sub>subj_id</sub></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">83 <sub>subj_id</sub></td>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm; border-top:1px solid;">Observations</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">164</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">164</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left; border-top:1px solid;" colspan="3">163</td>
</tr>
<tr>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; text-align:left; padding-top:0.1cm; padding-bottom:0.1cm;">Marginal R<sup>2</sup> / Conditional R<sup>2</sup></td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.020 / 0.715</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.020 / 0.714</td>
<td style=" padding:0.2cm; text-align:left; vertical-align:top; padding-top:0.1cm; padding-bottom:0.1cm; text-align:left;" colspan="3">0.410 / 0.554</td>
</tr>

</table>


```r
  m_1 <- lm(ep_2 ~ tx, data = me_sbp_df)
  summary(m_1)
```

```
## 
## Call:
## lm(formula = ep_2 ~ tx, data = me_sbp_df)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -32.790  -9.723  -2.723   8.277  41.210 
## 
## Coefficients:
##             Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  136.790      1.584  86.344   <2e-16 ***
## tx2           -3.067      2.227  -1.377     0.17    
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 14.26 on 162 degrees of freedom
##   (1 observation deleted due to missingness)
## Multiple R-squared:  0.01157,	Adjusted R-squared:  0.005473 
## F-statistic: 1.897 on 1 and 162 DF,  p-value: 0.1703
```


```r
  m_paired_fixed <- lm(ep_2 ~ tx + subj_id, data = me_sbp_df)
  summary(m_paired_fixed)
```

```
## 
## Call:
## lm(formula = ep_2 ~ tx + subj_id, data = me_sbp_df)
## 
## Residuals:
##     Min      1Q  Median      3Q     Max 
## -16.685  -3.315   0.000   3.315  16.685 
## 
## Coefficients:
##               Estimate Std. Error t value Pr(>|t|)    
## (Intercept)  1.468e+02  5.473e+00  26.824  < 2e-16 ***
## tx2         -2.630e+00  1.209e+00  -2.175 0.032555 *  
## subj_idR002 -1.750e+01  7.693e+00  -2.275 0.025593 *  
## subj_idR003 -1.600e+01  7.693e+00  -2.080 0.040742 *  
## subj_idR004  1.900e+01  7.693e+00   2.470 0.015646 *  
## subj_idR005 -9.000e+00  7.693e+00  -1.170 0.245510    
## subj_idR006 -4.500e+00  7.693e+00  -0.585 0.560224    
## subj_idR007 -8.000e+00  7.693e+00  -1.040 0.301509    
## subj_idR008 -3.550e+01  7.693e+00  -4.615 1.48e-05 ***
## subj_idR009  1.500e+00  7.693e+00   0.195 0.845899    
## subj_idR010 -2.150e+01  7.693e+00  -2.795 0.006499 ** 
## subj_idR011 -6.000e+00  7.693e+00  -0.780 0.437727    
## subj_idR012 -6.000e+00  7.693e+00  -0.780 0.437727    
## subj_idR013  2.900e+01  7.693e+00   3.770 0.000311 ***
## subj_idR014  2.000e+00  7.693e+00   0.260 0.795547    
## subj_idR015 -1.400e+01  7.693e+00  -1.820 0.072520 .  
## subj_idR016  7.500e+00  7.693e+00   0.975 0.332536    
## subj_idR017 -8.500e+00  7.693e+00  -1.105 0.272508    
## subj_idR018 -1.650e+01  7.693e+00  -2.145 0.035000 *  
## subj_idR019 -1.500e+01  7.693e+00  -1.950 0.054697 .  
## subj_idR020 -4.000e+00  7.693e+00  -0.520 0.604527    
## subj_idR021 -3.150e+01  7.693e+00  -4.095 0.000100 ***
## subj_idR022 -2.100e+01  7.693e+00  -2.730 0.007791 ** 
## subj_idR023 -2.300e+01  7.693e+00  -2.990 0.003708 ** 
## subj_idR024  1.200e+01  7.693e+00   1.560 0.122735    
## subj_idR025 -6.500e+00  7.693e+00  -0.845 0.400666    
## subj_idR026 -3.300e+01  7.693e+00  -4.290 4.97e-05 ***
## subj_idR027 -1.000e+01  7.693e+00  -1.300 0.197368    
## subj_idR028 -6.500e+00  7.693e+00  -0.845 0.400666    
## subj_idR029 -3.319e+01  9.441e+00  -3.515 0.000727 ***
## subj_idR030 -7.500e+00  7.693e+00  -0.975 0.332536    
## subj_idR031 -1.900e+01  7.693e+00  -2.470 0.015646 *  
## subj_idR032 -2.600e+01  7.693e+00  -3.380 0.001124 ** 
## subj_idR033 -3.450e+01  7.693e+00  -4.485 2.41e-05 ***
## subj_idR034 -5.000e+00  7.693e+00  -0.650 0.517586    
## subj_idR035 -2.200e+01  7.693e+00  -2.860 0.005405 ** 
## subj_idR036  6.245e-13  7.693e+00   0.000 1.000000    
## subj_idR037 -4.500e+00  7.693e+00  -0.585 0.560224    
## subj_idR038 -5.000e+00  7.693e+00  -0.650 0.517586    
## subj_idR039 -1.050e+01  7.693e+00  -1.365 0.176112    
## subj_idR040 -2.000e+01  7.693e+00  -2.600 0.011105 *  
## subj_idR041 -2.500e+00  7.693e+00  -0.325 0.746048    
## subj_idR042 -1.750e+01  7.693e+00  -2.275 0.025593 *  
## subj_idR043 -2.800e+01  7.693e+00  -3.640 0.000482 ***
## subj_idR044  9.500e+00  7.693e+00   1.235 0.220480    
## subj_idR045  9.500e+00  7.693e+00   1.235 0.220480    
## subj_idR046 -1.400e+01  7.693e+00  -1.820 0.072520 .  
## subj_idR047 -6.000e+00  7.693e+00  -0.780 0.437727    
## subj_idR048 -1.600e+01  7.693e+00  -2.080 0.040742 *  
## subj_idR049 -1.550e+01  7.693e+00  -2.015 0.047280 *  
## subj_idR050 -1.850e+01  7.693e+00  -2.405 0.018490 *  
## subj_idR051 -1.550e+01  7.693e+00  -2.015 0.047280 *  
## subj_idR052 -1.700e+01  7.693e+00  -2.210 0.029975 *  
## subj_idR053  5.500e+00  7.693e+00   0.715 0.476724    
## subj_idR054 -2.550e+01  7.693e+00  -3.315 0.001380 ** 
## subj_idR055 -2.050e+01  7.693e+00  -2.665 0.009315 ** 
## subj_idR056 -1.350e+01  7.693e+00  -1.755 0.083111 .  
## subj_idR057 -6.000e+00  7.693e+00  -0.780 0.437727    
## subj_idR058 -2.800e+01  7.693e+00  -3.640 0.000482 ***
## subj_idR059 -1.800e+01  7.693e+00  -2.340 0.021786 *  
## subj_idR060 -2.319e+01  9.441e+00  -2.456 0.016226 *  
## subj_idR061 -3.000e+00  7.693e+00  -0.390 0.697595    
## subj_idR062  1.250e+01  7.693e+00   1.625 0.108122    
## subj_idR063  3.000e+00  7.693e+00   0.390 0.697595    
## subj_idR064  1.500e+00  7.693e+00   0.195 0.845899    
## subj_idR065 -8.500e+00  7.693e+00  -1.105 0.272508    
## subj_idR066 -1.000e+00  7.693e+00  -0.130 0.896901    
## subj_idR067 -2.950e+01  7.693e+00  -3.835 0.000249 ***
## subj_idR068 -2.500e+00  7.693e+00  -0.325 0.746048    
## subj_idR069  2.300e+01  7.693e+00   2.990 0.003708 ** 
## subj_idR070 -1.750e+01  7.693e+00  -2.275 0.025593 *  
## subj_idR071 -1.500e+00  7.693e+00  -0.195 0.845899    
## subj_idR072 -3.500e+00  7.693e+00  -0.455 0.650366    
## subj_idR073 -9.000e+00  7.693e+00  -1.170 0.245510    
## subj_idR074  1.300e+01  7.693e+00   1.690 0.094946 .  
## subj_idR075 -1.950e+01  7.693e+00  -2.535 0.013201 *  
## subj_idR076 -1.300e+01  7.693e+00  -1.690 0.094946 .  
## subj_idR077 -2.400e+01  7.693e+00  -3.120 0.002517 ** 
## subj_idR078 -9.000e+00  7.693e+00  -1.170 0.245510    
## subj_idR079 -2.450e+01  7.693e+00  -3.185 0.002065 ** 
## subj_idR080 -2.700e+01  7.693e+00  -3.510 0.000740 ***
## subj_idR081 -8.000e+00  7.693e+00  -1.040 0.301509    
## subj_idR082 -1.200e+01  7.693e+00  -1.560 0.122735    
## subj_idR083 -1.800e+01  7.693e+00  -2.340 0.021786 *  
## ---
## Signif. codes:  0 '***' 0.001 '**' 0.01 '*' 0.05 '.' 0.1 ' ' 1
## 
## Residual standard error: 7.693 on 80 degrees of freedom
##   (1 observation deleted due to missingness)
## Multiple R-squared:  0.8579,	Adjusted R-squared:  0.7105 
## F-statistic: 5.819 on 83 and 80 DF,  p-value: 4.611e-14
```


```r
  m_paired <- lmer(ep_2 ~ tx + (1 | subj_id), data = me_sbp_df)

  summary(m_paired)
```

```
## Linear mixed model fit by REML ['lmerMod']
## Formula: ep_2 ~ tx + (1 | subj_id)
##    Data: me_sbp_df
## 
## REML criterion at convergence: 1274.3
## 
## Scaled residuals: 
##      Min       1Q   Median       3Q      Max 
## -2.03830 -0.52129 -0.01784  0.51783  2.50876 
## 
## Random effects:
##  Groups   Name        Variance Std.Dev.
##  subj_id  (Intercept) 144.85   12.035  
##  Residual              59.33    7.703  
## Number of obs: 164, groups:  subj_id, 83
## 
## Fixed effects:
##             Estimate Std. Error t value
## (Intercept)  136.480      1.578  86.487
## tx2           -2.757      1.208  -2.282
## 
## Correlation of Fixed Effects:
##     (Intr)
## tx2 -0.391
```

