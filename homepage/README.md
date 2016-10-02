# Homepage
My personal startpage which will show on a new tab or as browser homepage.

## Custom bookmarks
Create a file `bookmarks.js` in the homepage root directory, and use this for example:
```
var bookmarks = [
  {
    'title': 'Search engines',
    'href': '#',
    'sub': [
      {
        'title': 'Google',
        'href': 'https://wiki.zdev.com/'
      },
      {
        'title': 'Bing',
        'href': 'https://bing.com/'
      },
      {
        'title': 'Yandex',
        'href': 'https://yandex.com/'
      }
    ]
  },
  {
    'title': 'Sub menu',
    'href': '#',
    'sub': [
      {
        'title': 'You',
        'href': '#',
        'sub': [
          {
            'title': 'Can',
            'href': '#',
            'sub': [
              {
                'title': 'Make',
                'href': '#',
                'sub': [
                  {
                    'title': 'Infinite',
                    'href': '#',
                    'sub': [
                      {
                        'title': 'Submenus',
                        'href': '#'
                      }
                    ]
                  }
                ]
              }
            ]
          }
        ]
      }
    ]
  }
];
```
