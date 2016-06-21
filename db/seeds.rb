
['user', 'banned', 'moderator', 'admin'].each do |role|
  Role.where(title: role).first_or_create
end

User.create(username: "ImErot", email: "wesly@mezarina.me", password: "wisper11", role_id: 4)

Category.create(title: 'site news')
Category.create(title: 'industry news')
Category.create(title: 'general')
Category.create(title: 'anime')
Category.create(title: 'manga')
Category.create(title: 'visual novels')
Category.create(title: 'feedback')
Category.create(title: 'events')
Category.create(title: 'gaming')
Category.create(title: 'music')
Category.create(title: 'recommendation')
Category.create(title: 'dev')
Category.create(title: 'creations')


['action', 'adventure', 'cars', 'comedy', 'dementia', 'demons', 'drama',
  'ecchi', 'fantasy', 'game', 'harem', 'hentai', 'historical', 'horror',
  'josei', 'kids', 'magic', 'martial arts', 'mecha', 'military', 'music',
  'mystery', 'parody', 'police', 'phychological', 'romance', 'samurai',
  'school', 'sci-fi', 'seinen', 'shoujo', 'shoujo ai', 'shounen',
  'shounen ai', 'slice of life', 'space', 'sports', 'super power',
  'supernatural', 'thriller', 'vampire', 'yaoi', 'yuri'].each do |genre|
    Genre.find_or_create_by({title: genre})
  end

  ["Winter 2016", "Spring 2016", "Summer 2016", "Fall 2016", "Winter 2015", "Spring 2015", "Summer 2015", "Fall 2015", "Winter 2014", "Spring 2014", "Summer 2014",
    "Fall 2014", "Winter 2013", "Spring 2013", "Summer 2013", "Fall 2013", "Winter 2012", "Spring 2012", "Summer 2012", "Fall 2012", "Winter 2011", "Spring 2011",
    "Summer 2011", "Fall 2011", "Winter 2010", "Spring 2010", "Summer 2010", "Fall 2010", "Winter 2009", "Spring 2009", "Summer 2009", "Fall 2009", "Winter 2008",
    "Spring 2008", "Summer 2008", "Fall 2008", "Winter 2007", "Spring 2007", "Summer 2007", "Fall 2007", "Winter 2006", "Spring 2006", "Summer 2006", "Fall 2006",
    "Winter 2005", "Spring 2005", "Summer 2005", "Fall 2005", "Winter 2004", "Spring 2004", "Summer 2004", "Fall 2004", "Winter 2003", "Spring 2003", "Summer 2003",
    "Fall 2003", "Winter 2002", "Spring 2002", "Summer 2002", "Fall 2002", "Winter 2001", "Spring 2001", "Summer 2001", "Fall 2001", "Winter 2000", "Spring 2000", "Summer 2000",
    "Fall 2000", "Winter 1999", "Spring 1999", "Summer 1999", "Fall 1999", "Winter 1998", "Spring 1998", "Summer 1998", "Fall 1998", "Winter 1997", "Spring 1997", "Summer 1997",
    "Fall 1997", "Winter 1996", "Spring 1996", "Summer 1996", "Fall 1996", "Winter 1995", "Spring 1995", "Summer 1995", "Fall 1995", "Winter 1994", "Spring 1994", "Summer 1994",
     "Fall 1994", "Winter 1993", "Spring 1993", "Summer 1993", "Fall 1993", "Winter 1992", "Spring 1992", "Summer 1992", "Fall 1992", "Winter 1991", "Spring 1991", "Summer 1991",
    "Fall 1991", "Winter 1990", "Spring 1990", "Summer 1990", "Fall 1990", "Winter 1989", "Spring 1989", "Summer 1989", "Fall 1989", "Winter 1988", "Spring 1988", "Summer 1988", "Fall 1988",
    "Winter 1987", "Spring 1987", "Summer 1987", "Fall 1987", "Winter 1986", "Spring 1986", "Summer 1986", "Fall 1986", "Winter 1985", "Spring 1985",
    "Summer 1985", "Fall 1985", "Winter 1984", "Spring 1984", "Summer 1984", "Fall 1984", "Winter 1983", "Spring 1983",
    "Summer 1983", "Fall 1983", "Winter 1982", "Spring 1982", "Summer 1982", "Fall 1982", "Winter 1981", "Spring 1981", "Summer 1981", "Fall 1981", "Winter 1980",
    "Spring 1980", "Summer 1980", "Fall 1980", "Winter 1979", "Spring 1979", "Summer 1979", "Fall 1979", "Winter 1978", "Spring 1978", "Summer 1978", "Fall 1978",
    "Winter 1977", "Spring 1977", "Summer 1977", "Fall 1977", "Winter 1976", "Spring 1976", "Summer 1976", "Fall 1976", "Winter 1975", "Spring 1975", "Summer 1975",
    "Fall 1975", "Winter 1974", "Spring 1974", "Summer 1974", "Fall 1974", "Winter 1973", "Spring 1973", "Summer 1973", "Fall 1973", "Winter 1972", "Spring 1972",
    "Summer 1972", "Fall 1972", "Winter 1971", "Spring 1971", "Summer 1971", "Fall 1971", "Winter 1970", "Spring 1970", "Summer 1970", "Fall 1970", "Winter 1969",
    "Spring 1969", "Summer 1969", "Fall 1969", "Winter 1968", "Spring 1968", "Summer 1968", "Fall 1968", "Winter 1967", "Spring 1967", "Summer 1967", "Fall 1967",
    "Winter 1966", "Spring 1966", "Summer 1966", "Fall 1966", "Winter 1965", "Spring 1965", "Summer 1965", "Fall 1965", "Winter 1964", "Spring 1964", "Summer 1964",
    "Fall 1964", "Winter 1963", "Spring 1963", "Summer 1963", "Fall 1963", "Winter 1962", "Spring 1962", "Summer 1962", "Fall 1962", "Winter 1961", "Spring 1961", "Summer 1961",
    "Fall 1961", "Winter 1960", "Spring 1960", "Summer 1960", "Fall 1960", "Winter 1959", "Spring 1959", "Summer 1959", "Fall 1959", "Winter 1958", "Spring 1958", "Summer 1958", "Fall 1958",
    "Winter 1957", "Spring 1957", "Summer 1957", "Fall 1957", "Winter 1956", "Spring 1956", "Summer 1956", "Fall 1956", "Winter 1955", "Spring 1955", "Summer 1955", "Fall 1955", "Winter 1954",
    "Spring 1954", "Summer 1954", "Fall 1954", "Winter 1953", "Spring", "1953", "Summer 1953", "Fall 1953", "Winter 1952", "Spring 1952", "Summer 1952", "Fall 1952", "Winter 1951", "Spring 1951",
    "Summer 1951", "Fall 1951", "Winter 1950", "Spring 1950", "Summer 1950", "Fall 1950", "Winter 1949", "Spring 1949", "Summer 1949", "Fall 1949", "Winter 1948", "Spring 1948", "Summer 1948",
    "Fall 1948", "Winter 1947", "Spring 1947", "Summer 1947", "Fall 1947", "Winter 1946", "Spring 1946", "Summer 1946", "Fall 1946", "Winter 1945", "Spring 1945", "Summer 1945", "Fall 1945",
    "Winter 1944", "Spring 1944", "Summer 1944", "Fall 1944", "Winter 1943", "Spring 1943", "Summer 1943", "Fall 1943", "Winter 1942", "Spring 1942", "Summer 1942", "Fall 1942", "Winter 1941",
    "Spring 1941", "Summer 1941", "Fall 1941", "Winter 1940", "Spring 1940", "Summer 1940", "Fall 1940", "Winter 1939", "Spring 1939", "Summer 1939", "Fall", "1939", "Winter", "1938", "Spring 1938",
    "Summer 1938", "Fall 1938", "Winter 1937", "Spring 1937", "Summer 1937", "Fall 1937", "Winter 1936", "Spring 1936", "Summer 1936", "Fall 1936", "Winter", "1935", "Spring", "1935", "Summer 1935",
    "Fall 1935", "Winter 1934", "Spring 1934", "Summer 1934", "Fall 1934", "Winter 1933", "Spring 1933", "Summer 1933", "Fall 1933", "Winter 1932", "Spring 1932", "Summer 1932", "Fall 1932",
    "Winter", "1931", "Spring", "1931", "Summer", "1931", "Fall", "1931", "Winter 1930", "Spring 1930", "Summer 1930", "Fall 1930", "Winter 1929", "Spring 1929", "Summer 1929", "Fall 1929", "Winter 1928",
    "Spring 1928", "Summer 1928", "Fall 1928", "Winter 1927", "Spring 1927", "Summer 1927", "Fall 1927", "Winter 1926", "Spring 1926", "Summer 1926", "Fall 1926", "Winter 1925", "Spring 1925",
    "Summer", "1925", "Fall", "1925", "Winter", "1924", "Spring", "1924", "Summer", "1924", "Fall", "1924", "Winter", "1923", "Spring", "1923", "Summer", "1923", "Fall 1923", "Winter 1922", "Spring 1922", "Summer 1922",
    "Fall 1922", "Winter 1921", "Spring 1921", "Summer 1921", "Fall 1921", "Winter 1920", "Spring 1920", "Summer 1920",
    "Fall 1920", "Winter 1919", "Spring 1919", "Summer 1919", "Fall 1919", "Winter 1918", "Spring 1918", "Summer 1918", "Fall 1918", "Winter 1917", "Spring 1917", "Summer 1917", "Fall 1917"
  ].each do |season|
    Season.find_or_create_by({title: season})
  end
