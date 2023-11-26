% CATEGORIAS: categoria(nombre_categoria)
categoria('Animacion').
categoria('Animales').
categoria('Arte y Literatura').
categoria('Deporte').
categoria('Entretenimiento').
categoria('Espiritualidad').
categoria('Historia').
categoria('Misterio').
categoria('Musica').
categoria('Salud y Fitness').
categoria('Videojuegos').
categoria('Viajes').

% VIDEOS: video(videoID,Título,Categoria,Duracion,Idioma).
%
% videos de Animacion
video('e9dZQelULDk','Hapiness','Animacion','[0-5]','Any').
video('0UgiJPnwtQU','Cream by David Firth','Animacion','[5-15]','Eng').
video('FavUpD_IjVY','Cows & Cows & Cows','Animacion','[0-5]','Any').
video('xYnv8tHyOJE','Catopolis','Animacion','[10-15]','Eng').
%
% videos de Animales
video('eW6hheq8qfg','Guinea pigs go crazy for water melon','Animales','[6-15]','Any').
video('JQL25_hoQ1k','7 Spectacular Moths in Slow Motion!','Animales','[0-5]','Any').
video('2AP9dfBTcNQ','Cómo crecen los gatitos: de 0 día a 1 año','Animales','[41-60]','Any').
%
% videos de Arte-Literatura
video('bvEHyeph1B4','Stanczyk or the Sad Clown Paradox','Arte y Literatura','[6-15]','Eng').
video('-qCngjk3nQw','The Most Disturbing Painting - A Different Take on Saturn Devouring His Son','Arte y Literatura','[6-15]','Eng').
%
% videos de Deporte
%
% videos de Entretenimiento
video('K-oIzf3MQdg','7 Latin Americans Guess Each Others Nationality!! (What country Im From?)','Entretenimiento','[16-25]','Eng').
%
% videos de Espiritualidad
video('JYdi7vxRdqM','6 Things That Helped Me Become Successful & Highly Creative','Espiritualidad','[16-25]','Eng').
%
% videos de Historia
video('G1p6rlDCxq0','World War One (ALL PARTS)','Historia','[61-180]','Eng').
%
% videos de Viajes
video('Rb9gLpdb2nc','Llegué a EGIPTO y todo es IMPACTANTE','Viajes','[16-25]','Esp').
%
% videos de Misterio
video('kd2KEHvK-q8','The Vanishing of Flight 370','Misterio','[16-25]','Eng').
video('I2O7blSSzpI','Cicada 3301: An Internet Mystery','Misterio','[16-25]','Eng').
video('B6Gi1uKr15Y','TODO sobre el MISTERIOSO caso de JONBENÉT RAMSEY','Misterio','[26-40]','Esp').
video('2CBCqwn2w64','Historias Innecesarias: El Clan Puccio - La historia definitiva','Misterio','[41-60]','Esp').
%
% videos de Videojuegos
video('GLtAJ52OGu8','El Videojuego mas Cruel que Conocí','Videojuegos','[16-25]','Esp').
video('JfFEWkHXq6o','El Mundo mas Vivo Jamás Creado en un Videojuego','Videojuegos','[16-25]','Esp').
%
% video de Tecnologia
video('YNMkADpvO4w','Simulando la evolución de la agresión','Tecnologia','[5-15]','Eng').

% USUARIOS: usuario(nombre_usuario)
usuario('Delfina').
opinion('Delfina','e9dZQelULDk',1).
opinion('Delfina','0UgiJPnwtQU',1).
opinion('Delfina','FavUpD_IjVY',1).
opinion('Delfina','kd2KEHvK-q8',1).
opinion('Delfina','G1p6rlDCxq0',0).
opinion('Delfina','B6Gi1uKr15Y',0).



% devuelven TRUE si existe la categor�a especificada
existe_categoria(Categoria):-
    categoria(Categoria).

% devuelven TRUE si existe un video con el ID especificado
existe_video(VideoID):-
    video(VideoID,_,_,_,_).

% devuelven TRUE si existe un usuario con el nombre especificado
existe_usuario(Usuario):-
    usuario(Usuario).

% devuelve TRUE si el video existe y pertenece a la categor�a
video_pertenece_a_categoria(Video,Categoria):-
    existe_video(Video), existe_categoria(Categoria), video(Video,_,Categoria,_,_).

% devuelve TRUE si el usuario dado ha visto el video especificado
ha_visto(Usuario,Video):-
    existe_usuario(Usuario), existe_video(Video), opinion(Usuario,Video,_).


cant_videos(C) :-
    findall(X, video(X,_,_,_,_), Videos),
    length(Videos, C).

% devuelve una lista de todos los videos
all_videos(Videos):-
    findall(video(ID,Titulo,Categoria,Duracion,Idioma),video(ID,Titulo,Categoria,Duracion,Idioma),Videos).

get_video(ID,Video) :-
    findall((Categoria,Duracion,Idioma),video(ID,_,Categoria,Duracion,Idioma),Video).

% devuelve una lista de todas las categorias
all_categorias(Categorias) :-
    findall(Nombre,categoria(Nombre),Categorias).

% devuelve una lista de todos los videos de cierta categoria
videos_por_categoria(Categoria,Videos) :-
    findall(Video,video_pertenece_a_categoria(Video,Categoria),Videos).

% devuelve una lista de todos los videos vistos por un usuario dado
videos_vistos_por_usuario(Usuario,Historial) :-
    findall((VideoID,Opinion),opinion(Usuario,VideoID,Opinion),Historial).

% devuelve una lista de todos los videos NO vistos por un usuario dado
videos_no_vistos_por_usuario(Usuario,NoVistos) :-
    findall((VideoID,Categoria,Duracion,Idioma),(video(VideoID,_,Categoria,Duracion,Idioma),\+ opinion(Usuario, VideoID, _)),NoVistos).

