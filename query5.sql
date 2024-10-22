-- exercises

SELECT * FROM cd.facilities;

SELECT name, membercost, guestcost
FROM cd.facilities;

SELECT name, membercost
FROM cd.facilities
WHERE membercost > 0;

SELECT facid, name, membercost, monthlymaintenance
FROM cd.facilities
WHERE membercost > 0
AND membercost < (monthlymaintenance/50.0);

SELECT *
FROM cd.facilities
WHERE name LIKE '%Tennis%';

SELECT *
FROM cd.facilities
WHERE facid IN (1,5);

SELECT *
FROM cd.members
WHERE joindate >= '2012-09-01';

SELECT DISTINCT(surname)
FROM cd.members
ORDER BY surname
LIMIT 10;

SELECT joindate
FROM cd.members
ORDER BY joindate DESC
LIMIT 1;

SELECT COUNT(facid)
FROM cd.facilities
WHERE guestcost >= 10;

SELECT facid, SUM(SLOTS) AS total_slots
FROM cd.bookings
WHERE starttime >= '2012-09-01'
AND starttime <= '2012-09-30'
GROUP BY facid
ORDER BY SUM(slots);

SELECT facid, SUM(SLOTS) as total_slots
FROM cd.bookings
GROUP BY facid
HAVING SUM(SLOTS) > 1000
ORDER BY facid;

SELECT starttime AS start, cd.facilities.name
FROM cd.bookings
INNER JOIN cd.facilities ON
cd.bookings.facid = cd.facilities.facid
WHERE cd.facilities.facid IN (0,1)
AND starttime >= '2012-09-21'
AND starttime < '2012-09-22'
ORDER BY starttime;

SELECT starttime AS start, surname, firstname
FROM cd.bookings
INNER JOIN cd.members
ON cd.bookings.memid = cd.members.memid
WHERE surname = 'Farrell' AND firstname = 'David';