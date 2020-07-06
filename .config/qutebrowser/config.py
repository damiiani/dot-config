# Dracula theme
import dracula.draw

# Load existing settings made via :set
config.load_autoconfig()

dracula.draw.blood(c, {
    'spacing': {
        'vertical': 4,
        'horizontal': 8
    }
})

# Command bindings
# h j k l  to  j k l ç

c.bindings.commands["normal"] = {
    "J": "tab-prev",
    "K": "back",
    "L": "forward",
    "\u00c7": "tab-next",

    "j": "scroll left",
    "k": "scroll-px 0 30",
    "l": "scroll-px 0 -30",
    "\u00e7": "scroll right",

    "q": "tab-close"
}

c.content.autoplay = False

c.completion.web_history.max_items = 0
c.confirm_quit = ["always"]

c.content.cookies.store = False
c.content.headers.accept_language = "pt-BR,pt;q=0.9"
c.content.headers.user_agent = "Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0"
c.content.pdfjs = True
c.content.private_browsing = True

c.downloads.location.directory = "~/downloads"

c.fonts.default_family = "Droid Sans"

c.url.default_page = "https://duckduckgo.com/?k7=282a36&k8=f8f8f2&k9=50fa7b&kae=t&kt=p&ks=m&kw=n&km=l&ko=s&kj=282a36&ka=p&kaa=bd93f9&ku=-1&kx=f1fa8c&ky=44475a&kaf=1&kai=1&kf=1"
c.url.start_pages = "https://start.duckduckgo.com/?k7=282a36&k8=f8f8f2&k9=50fa7b&kae=t&kt=p&ks=m&kw=n&km=l&ko=s&kj=282a36&ka=p&kaa=bd93f9&ku=-1&kx=f1fa8c&ky=44475a&kaf=1&kai=1&kf=1"

c.url.searchengines = {
    "DEFAULT": "https://duckduckgo.com/?q={}&k7=282a36&k8=f8f8f2&k9=50fa7b&kae=t&kt=p&ks=m&kw=n&km=l&ko=s&kj=282a36&ka=p&kaa=bd93f9&ku=-1&kx=f1fa8c&ky=44475a&kaf=1&kai=1&kf=1"
}

c.scrolling.bar = "always"

c.tabs.background = True
