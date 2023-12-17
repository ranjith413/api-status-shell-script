#!bin/bash

echo "<!DOCTYPE html>
<html>
<style>
table, th, td {
  border:1px solid black;
}
</style>
<body>

<h2>Urls Status</h2>

<table >
<tr>
<th>Time</th>
<th>api</th>
<th>Status</th>
</tr>" >> status.html

file="urls.txt"

while read line
do
name=$(echo $line | cut -d " " -f1)
echo $name
url=$(echo $line | cut -d " " -f2)
echo $url
date_now="$(TZ='IST' date '+%D %T')"
echo $date_now
statuscode=$(curl -s -i /dev/null  http://$url | head -1 | cut -d " " -f2)
echo $statuscode
echo "<tr>
<td> $date_now </td>
<td> $name </td>
<td> $statuscode </td>
</tr>" >> status.html
 
done < $file

echo "</table>
</body>
</html>" >> status.html
