# rss_check

Checks an RSS feed if specific keywords exist. Uses 2 Ansible variables, one for the feed and the other for the keyword.

## Variables

 - `rss_feed_url`: The RSS feed url you want to parse
   - Type: `string`
 - `rss_keywords`: The keywords to search for in the RSS feed
   - Type: list of `strings`

## Notes

Make sure the script is available on the system you will be running it.