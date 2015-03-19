/**
 * Created by paul on 3/18/15.
 */
$('div#years').append("<%= escape_javascript(render @year) %>");
$('div#<%= dom_id(@year) %>').effect('highlight');