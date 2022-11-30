---
layout: post
title:  "Various Style Guides"
date:   2022-12-01 07:35:18 +1000
category: [design]
author: gary 
---
# Styles and conventions

Creating a consistently styled environment creates familiarity and confidence for the end user, and provides a structural framework for future works and improvements.



# Dates and times
Dates can be formatted numerically and linguistically in many ways depending on the audience and purpose. Sometimes an exact timestamp is desirable. Other times an abbreviation or estimation is sufficient. The format should cater to the context of the datum, and the needs of the user.
Simply, the goal is to provide the most useful format in the most accessible manner based on the user’s current need.

**Precise**

_Numeric_

dd/MM/yyyy
hh:mm tt
Example:
01/12/2021
03:28 pm

_Numeric (humanised)_
(Padding zeros should be avoided unless required by the application or validation)

d/M/yyyy
h:mm tt
Example:
1/12/2021
3:28 pm

_Linguistic_
Writing a date in long form is easier for a human to read inline, though may be harder to compare using pattern sorting tools.
As per Australian standards, the year can be dropped from the linguistic format if the target date occurs within the current year.

dddd, d MMMM yyyy
Example:
Monday 5 December 2010
Monday 5 December


**Abbreviated**
If space is at a premium, common shorthand conventions can be used.

ddd d MMM
Example: Mon 5 Dec

**Approximated**
For further human-centric design improvement, friendly approximations can be used if the date is within a familiar context.
For example, if a date is within 1 day of today, then yesterday, today or tomorrow can be used instead of long form date formatting.

Example:

Yesterday
10:31 am

Updated today

Saved: A few minutes ago


For more reading on Australian an governmental standards, please refer to:
[Australian Govt Style Guide - Dates and Times](https://www.stylemanual.gov.au/grammar-punctuation-and-conventions/numbers-and-measurements/dates-and-time)



# Date and time style guide for mobile applications
Mobile applications are designed to be maximally user-friendly and space efficient. Therefore it is recommended that a mix of formats be used according to context.

**Last saved to cloud hint**

Just now

15 minutes ago

2 hours ago

2 days ago

**A numeric date form field**

13/01/2021

13/1/2021 (humanised)

**A card list**

Today
Noon

Yesterday
10:41 am

Tue 5 Dec
1:59 pm


**A friendly date stamp**

9:31 am, Monday 5 December 2010















