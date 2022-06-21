pico-8 cartridge // http://www.pico-8.com
version 29
__lua__
function _init()
	p={x=60,y=60,speed=1}
	bullets={}
	pigeons={}
	spawn_pigeons()
end

function _update60()
	if (btn(➡️))	p.x+=p.speed
	if (btn(⬅️)) p.x-=p.speed
	if (btnp(❎)) shoot()
	
	update_bullets()
	
	update_pigeons()
	if #pigeons==0 then
		spawn_pigeons()
	end
	
	camera_follow()
end

function _draw()
	cls(13)
	map(0,0,0,0)
	
	--player
	spr(1,p.x,p.y)
	
	--pigeons
	for e in all(pigeons) do
		spr(5,e.x,e.y)
	end
	
	--shoot
	for b in all(bullets) do
		spr(40,b.x,b.y)
	end
end




-->8
--bullets

function shoot()
	local new_bullet={
		x=p.x,
		y=p.y,
		speed=4
	}
	add(bullets, new_bullet)
end

function update_bullets()
	for b in all(bullets) do
		b.y-=b.speed
		if (b.y<-8) del(bullets,b)
	end
end
-->8
--camera

function camera_follow()
	cam_x=p.x-60
	cam_x=mid(0,cam_x,896)
	camera(cam_x)
end
-->8
--pigeons

function spawn_pigeons()
	add(pigeons,{
		x=60,
		y=10,
		life=4
	})
end

function update_pigeons()
	for pigeon in all(pigeons) do
		pigeon.x -= 0.3
		if pigeon.x < 130 then
			del(pigeons,pigeon)
		end
	end
end
__gfx__
0000000000555000eeeeeeee0000000005550000eedddeeeeeeeeeee6666666666666666eeeeeeeeeeee11111eeeeeeeeee111eeeeeeeeeeeeeeeeee00000000
00000000005f7000eedddeee0555000005f70000eedd8eeeeee66eee6666666666666666eeeee11111ee11111eeeeeeeee1111eeeeeeeeeeeeeeeeee00000000
0070070000fff000ee8d8eee05f700000fff0000eed669eeee6777eedddddddd66666666eeeee11111ee11111eeeeeeeee11111eeeeeeeeeeeeeeeee00000000
000770000066fff0eed9deee0fff00000ccc0000ed666eeee677777edddddddd66666666e11ee11111ee11111eeeeeee1111111eeeeeeeeeeeeeeeee00000000
00077000006660006666666e0ccc00000cfc0000edddaeee66677777dddddddd6666666611111111111111111e111ee111111111eeeeeeeeeeeeeeee00000000
0070070000111000dd666dde0cfc000011f10000eeeeaeeeeeeeeeeeaaaddaaa6666666611111111111111111e111ee111111111eeeeeeeeeeeeeeee00000000
0000000000101000eed6deee01f1110000010000eeeeeeeeeeeeeeeedddddddd6666666611111111111111111111111111111111eeeeeeeeeeeeeeee00000000
0000000000101000eeaeaeee0100000000010000eeeeeeeeeeeeeeeedddddddd6666666611111111111111111111111111111111eeeeeeeeeeeeeeee00000000
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeeeee9eeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeeeee9eeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeeee9a9eeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeee9aaa9eeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeee9aaa9eeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeeee9a9eeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeeee9a9eeeeeeeeeeeeeeeeeeeeee00000000000000000000000000000000000a0000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeeee9a9eeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeeee9a9eeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeeee9a9eeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeeee9a9eeeeeeeeeeeeeeeeeeeeee0000000000000006600000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeeee9a9eeeeeeeeeeeeeeeeeeeeee00000000eeeeee6777eeeeee00000000000000000000000000000000000000000000000000000000cccccccc00000000
eeeeeee9a9eeeeeeeeeeeeeeeeeeeeee00000000eeeee667777eeeee00000000000000000000000000000000000000000000000000000000cccccccc00000000
eeeeee9aaa9eeeeeeeeeeeeeeeeeeeee00000000eeee66777777eeee00000000000000000000000000000000000000000000000000000000cccccccc00000000
eeeeee9aaa9eeeeeeeeeeeeeeeeeeeee00000000ee666777777777ee00000000000000000000000000000000000000000000000000000000cccccccc00000000
eeeeee9aaa9eeeeeeeeeeeeeeeeeeeee00000000e66777777777777e00000000000000000000000000000000000000000000000000000000cccccccc00000000
eeeee9aaaaa9eeeeeeeeeeeeeeeeeeee00000000666667777777777700000000000000000000000000000000000000000000000000000000cccccccc00000000
eeee9aaa9aaa9eeeeeeeeeeeeeeeeeee00000000eeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000cccccccc00000000
eeee9aa9e9aa9eeeeeeeeeeeeeeeeeee00000000eeeeeeeeeeeeeeee00000000000000000000000000000000000000000000000000000000cccccccc00000000
eeee9aa999aa9eeeeeeeeeeeeeeeeeee00000000eeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
eee9aaaaaaaaa9eeeeeeeeeeeeeeeeee00000000eeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
eee9aaaaaaaaa9eeeeeeeeeeeeeeeeee00000000eeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
ee9aaaaaaaaaaa9eeeeeeeeeeeeeeeee00000000eeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
e9aaaaa9999aaaa9eeeeeeeeeeeeeeee00000000eeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
9aaaa99eee99aaaa9eeeeeeeeeeeeeee00000000eeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
9aaa9eeeeeee9aaa9eeeeeeeeeeeeeee00000000eeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
99999eeeeeee99999eeeeeeeeeeeeeee00000000eeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
__label__
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888ffffff882222228888888888888888888888888888888888888888888888888888888888888888228228888228822888fff8ff888888822888888228888
88888f8888f882888828888888888888888888888888888888888888888888888888888888888888882288822888222222888fff8ff888882282888888222888
88888ffffff882888828888888888888888888888888888888888888888888888888888888888888882288822888282282888fff888888228882888888288888
88888888888882888828888888888888888888888888888888888888888888888888888888888888882288822888222222888888fff888228882888822288888
88888f8f8f8882888828888888888888888888888888888888888888888888888888888888888888882288822888822228888ff8fff888882282888222288888
888888f8f8f882222228888888888888888888888888888888888888888888888888888888888888888228228888828828888ff8fff888888822888222888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
ddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd666dddddddddddddddddddddddddddddddddddddd
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee667777eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee8d8eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee66777777eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed9deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee666777777777eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee66777777777777eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedd666ddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666677777777777eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed6deeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaeaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedd8eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed669eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeee6777eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeee667777eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeee66777777eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeee666777777777eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeee66777777777777eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeee6666677777777777eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedddeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee8d8eeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed9deeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee6666666eeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee9eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeedd666ddeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee9eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeed6deeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee777777777777777777eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeaeaeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeedddeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeeeee9aaa9eeeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeedd8eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeeeee1aaa9eeeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeed669eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeeee171a9eeeeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeed666eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeeee17719eeeeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeedddaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeeee17771eeeeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeaeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeeee177771eeeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeeee17711eeeeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeeeee1171eeeeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeeeeee9a9eeeeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeeeeee9a9eeeeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeeeee9aaa9eeeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeeeee9aaa9eeeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeeeee9aaa9eeeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeeee9aaaaa9eeee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeee9aaa9aaa9eee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee7eeee9aa9e9aa9eee7eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee
eeeeeeeeeeee11111eeeeeeeeee111eeeeeeeeeeeeee11111eeeeee777777777777777777eeeeeeeeeeeeeeeeeee11111eeeeeeeeee111ee1eeeeeeeeeee1111
eeeee11111ee11111eeeeeeeee1111eeeeeee11111ee11111eeeeeeeee1111ee11ee11111eeeeeeeeeeee11111ee11111eeeeeeeee1111ee1eeeeeee11ee1111
eeeee11111ee11111eeeeeeeee11111eeeeee11111ee11111eeeeeeeee11111e11ee11111eeeeeeeeeeee11111ee11111eeeeeeeee11111e1eeeeeee11ee1111
e11ee11111ee11111eeeeeee1111111ee11ee11111ee11111eeeeeee1111111e11ee11111eeeeeeee11ee11111ee11111eeeeeee1111111e1eeeeeee11ee1111
11111111111111111e111ee11111111111111111111111111e111ee111111111111111111e111ee111111111111111111e111ee1111111111e111ee111111111
11111111111111111e111ee11111111111111111111111111e111ee111111111111111111e111ee111111111111111111e111ee1111111111e111ee111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
11111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
66666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666666
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
aaaddaaaaaaddaaaaaaddaaaaaaddaaaaaaddaaaaaaddaaaaaaddaaaaaaddaaaaaaddaaaaaaddaaaaaaddaaaaaaddaaaaaaddaaaaaaddaaaaaaddaaaaaaddaaa
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
dddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddddd
cccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1c
ccc1c1c1ccc1c1c1ccc1c1c1ccc1c1c1ccc1c1c1ccc1c1c1ccc1c1c1ccc1c1c1ccc1c1c1ccc1c1c1ccc1c1c1ccc1c1c1ccc1c1c1ccc1c1c1ccc1c1c1ccc1c1c1
cccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccccccc1ccc
cccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccccc
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555
555555555555575555555ddd55555d5d5d5d55555d5d555555555d5555555ddd555555a9eeeeee55555555555555555555555555555555555555555555555555
555555555555777555555ddd55555555555555555d5d5d55555555d55555d555d55555a9eeeeee56666666666666555557777755555555555555555555555555
555555555557777755555ddd55555d55555d55555d5d5d555555555d555d55555d5555aa9eeeee56ddd6d6d6ddd6555577ddd775566666555666665556666655
555555555577777555555ddd55555555555555555ddddd5555ddddddd55d55555d5555aa9eeeee56d6d6d6d6d6d6555577d7d77566dd666566ddd66566ddd665
5555555557577755555ddddddd555d55555d555d5ddddd555d5ddddd555d55555d5555aa9eeeee56d6d6ddd6ddd6555577d7d775666d66656666d665666dd665
5555555557557555555d55555d55555555555555dddddd555d55ddd55555d555d55555aaa9eeee56d6d666d666d6555577ddd775666d666566d666656666d665
5555555557775555555ddddddd555d5d5d5d555555ddd5555d555d5555555ddd5555559aaa9eee56ddd666d666d655557777777566ddd66566ddd66566ddd665
5555555555555555555555555555555555555555555555555555555555555555555555e9aa9eee56666666666666555577777775666666656666666566666665
55555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555555566666665ddddddd5ddddddd5ddddddd5
00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000555000eeeeeeee0000000005550000eedddeee0000000066666666cccccc1ceeeeeeeeeeee11111eeeeeeeeee111eeeeeeeeeeeeeeeeee00000000
00000000005f7000eedddeee0555000005f70000eedd8eee0006600066666666ccc1c1c1eeeee11111ee11111eeeeeeeee1111eeeeeeeeeeeeeeeeee00000000
0070070000fff000ee8d8eee05f700000fff0000eed669ee00677700ddddddddcccc1ccceeeee11111ee11111eeeeeeeee11111eeeeeeeeeeeeeeeee00000000
000770000066fff0eed9deee0fff00000ccc0000ed666eee06777770ddddddddcccccccce11ee11111ee11111eeeeeee1111111eeeeeeeeeeeeeeeee00000000
00077000006660006666666e0ccc00000cfc0000edddaeee66677777dddddddd1ccc1ccc11111111111111111e111ee111111111eeeeeeeeeeeeeeee00000000
0070070000111000dd666dde0cfc000011f10000eeeeaeee00000000aaaddaaac1c1c1cc11111111111111111e111ee111111111eeeeeeeeeeeeeeee00000000
0000000000101000eed6deee01f1110000010000eeeeeeee00000000ddddddddcc1ccccc11111111111111111111111111111111eeeeeeeeeeeeeeee00000000
0000000000101000eeaeaeee0100000000010000eeeeeeee00000000ddddddddcccccccc11111111111111111111111111111111eeeeeeeeeeeeeeee00000000
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeeeee9eeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeeeee9eeeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeeee9a9eeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee00000000
eeeeee9aaa9eeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeee9aaa9eeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeeee9a9eeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeeee9a9eeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeeee9a9eeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeeee9a9eeeeeeeeeeeeeeeeeeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeee00000000000000000000eeeeee0000000000000000000000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeee07777777777777777770eeeeee0000000000000006600000000000000000000000eeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee000000000000000000000000
eeeeee07a9eeeeeeeeeeeeee70eeeeee00000000eeeeee6777eeeeee000000000000000000000000000000000000000000000000000000000000000000000000
eeeeee07a9eeeeeeeeeeeeee70eeeeee00000000eeeee667777eeeee000000000000000000000000000000000000000000000000000000000000000000000000
eeeeee07aa9eeeeeeeeeeeee70eeeeee00000000eeee66777777eeee000000000000000000000000000000000000000000000000000000000000000000000000
eeeeee07aa9eeeeeeeeeeeee70eeeeee00000000ee666777777777ee000000000000000000000000000000000000000000000000000000000000000000000000
eeeeee07aa9eeeeeeeeeeeee70eeeeee00000000e66777777777777e000000000000000000000000000000000000000000000000000000000000000000000000
eeeee907aaa9eeeeeeeeeeee70eeeeee000000006666677777777777000000000000000000000000000000000000000000000000000000000000000000000000
eeee9a079aaa9eeeeeeeeeee70eeeeee00000000eeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
eeee9a07e9aa9eeeeeeeeeee70eeeeee00000000eeeeeeeeeeeeeeee000000000000000000000000000000000000000000000000000000000000000000000000
00000007000000000000000070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888
88282888882228222822288888282888882228222828288888888888888888888888888888888888888888888888888888888888888888888888888888888888
88282882882828282888288888282882882828282828288888888888888888888888888888888888888888888888888888888888888888888888888888888888
88828888882828282888288888222888882828282822288888888888888888888888888888888888888888888888888888888888888888888888888888888888
88282882882828282888288888882882882828282888288888888888888888888888888888888888888888888888888888888888888888888888888888888888
88282888882228222888288888222888882228222888288888888888888888888888888888888888888888888888888888888888888888888888888888888888
88888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888888

__map__
0d0e0d0e2c0e0d0e0d0e35360d0e0e0e29292929292929290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d1e1d1e1d1e1d062c1e45461d1e0e0e29292929292929290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d35360e0d0e0d0e0d0e0d0e0d0e0e0629292929292929290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d45461e1d1e1d10111e1d1b1b2c131e29292929292929290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0d0e2c0e060e0d20210e0d1b0622230e29293536292929290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
1d1e1d1e1d1e1d30311e1d1b1b32331e29292929292929290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
090a0b0c090a0b0c0a0b090a0b0c0b0a29292929292929290000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0707070707070707070707070707070707070707070707070000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0808080808080808080808080808080808080808080808080000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000000000003e3e3e3e3e3e3e3e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
00003e3e3e3e3e3e3e3e3e3e3e3e3e0000003e3e3e3e3e3e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000003e3e3e3e3e3e3e3e3e3e000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
000000000000003e3e3e3e3e0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000
