# Automatic line break
文字列を解析し改行を自動で行う

## Used character strings
「In the transparent wind in that country, Ihatove, even in summer the sky is a blue of the most profound coldness; the town of Morillo is set amongst dazzling forests, and the surrounding countryside quivers in waves of undulating vegetation.」  

- 訳  
「あのイーハトーヴォのすきとおった風、夏でも底に冷たさをもつ青いそら、うつくしい森で飾られたモリーオ市、郊外のぎらぎらひかる草の波。」

## Console log
```
i = 26, w = 308.8828, initialRS = 24, rememberSpace = 24, sub = 'In the transparent wind', s(prime)='in that country, Ihatove, even in summer the sky is a blue of the most profound coldness; the town of Morillo is set amongst dazzling forests, and the surrounding countryside quivers in waves of undulating vegetation.'  
i = 27, w = 312.02344, initialRS = 25, rememberSpace = 25, sub = 'in that country, Ihatove,', s(prime)='even in summer the sky is a blue of the most profound coldness; the town of Morillo is set amongst dazzling forests, and the surrounding countryside quivers in waves of undulating vegetation.'  
i = 24, w = 304.20703, initialRS = 22, rememberSpace = 22, sub = 'even in summer the sky', s(prime)='is a blue of the most profound coldness; the town of Morillo is set amongst dazzling forests, and the surrounding countryside quivers in waves of undulating vegetation.'  
i = 26, w = 310.69922, initialRS = 21, rememberSpace = 21, sub = 'is a blue of the most', s(prime)='profound coldness; the town of Morillo is set amongst dazzling forests, and the surrounding countryside quivers in waves of undulating vegetation.'  
i = 24, w = 301.27734, initialRS = 22, rememberSpace = 22, sub = 'profound coldness; the', s(prime)='town of Morillo is set amongst dazzling forests, and the surrounding countryside quivers in waves of undulating vegetation.'  
i = 25, w = 303.58594, initialRS = 22, rememberSpace = 22, sub = 'town of Morillo is set', s(prime)='amongst dazzling forests, and the surrounding countryside quivers in waves of undulating vegetation.'  
i = 24, w = 304.0664, initialRS = 16, rememberSpace = 16, sub = 'amongst dazzling', s(prime)='forests, and the surrounding countryside quivers in waves of undulating vegetation.'  
i = 25, w = 304.41797, initialRS = 16, rememberSpace = 16, sub = 'forests, and the', s(prime)='surrounding countryside quivers in waves of undulating vegetation.'  
i = 24, w = 309.3047, initialRS = 23, rememberSpace = 23, sub = 'surrounding countryside', s(prime)='quivers in waves of undulating vegetation.'  
i = 25, w = 310.3125, initialRS = 19, rememberSpace = 19, sub = 'quivers in waves of', s(prime)='undulating vegetation.' 
```


![](https://raw.githubusercontent.com/ShiraishiKakuya/Automatic_line_break/master/images_for_documentation/00.png)
