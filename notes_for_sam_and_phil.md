Challenges:

Having multiple forms on a single page. One submit button will only submit the last item on the page. But we want to submit everything!

Ways around it: we tried using AJAX to serve up a single form on the page at a time. Didn't work because the submit buttons were still getting mixed up and we coudln't dynamically get a submit button to act appropriately (they would target each other).

We couldn't target just one form when the forms were generated dynamically. We couldn't dynamically give them form IDs and then target those dyanmically generated form IDs.

