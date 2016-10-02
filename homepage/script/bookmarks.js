if (!bookmarks) {
  var bookmarks = [
    {
      'title': 'You can create your own bookmars, click here to learn more!',
      'href': 'https://github.com/kevinvdburgt/dotfiles/homepage',
    },
    {
      'title': 'Example',
      'href': '#',
      'sub': [
        {
          'title': 'Item',
          'href': '#',
        },

        {
          'title': 'Sub Itemz',
          'href': '#',
          'sub': [
            {
              'title': 'Hello',
              'href': '#',
            },
            {
              'title': 'World',
              'href': '#',
              'sub': [
                {
                  'title': 'Infinite sub menus',
                  'href': '#'
                }
              ]
            }
          ]
        }
      ]
    }
  ];
}

function bookmarksCreate(element, data) {
  var list = document.createElement('ul');
  element.appendChild(list);

  data.forEach(function (entry) {
    var item = document.createElement('li');
    list.appendChild(item);

    var link = document.createElement('a');
    item.appendChild(link);

    link.setAttribute('href', entry.href);
    link.appendChild(document.createTextNode(entry.title));

    if (entry.sub && entry.sub.length > 0) {
      bookmarksCreate(item, entry.sub);
    }
  });
}

bookmarksCreate(document.querySelector('nav.bookmarks'), bookmarks);
