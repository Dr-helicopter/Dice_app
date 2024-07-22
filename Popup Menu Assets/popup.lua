local popup = {
	
	extends = "Control",
	xpos = 0,

	_ready = function(e)
		up_anchor = e.rect_position.y
		down_anchor = e.rect_position.y + e.rect_size.y
		target = down_anchor
		end,

	_process = function(e , delta)
		e:set_position(Vector2(xpos , lerp(e.rect_position.y, target , 0.2 )), false)
		end,
}

xpos = 0 poped = false 

function popup:_on_TextureButton_pressed()
	if poped then
		self.close()
	 else
		self.open()
		end
	end


function popup:_unhandled_input(e)
	if e.typ == "swip" then
		if e.relative.y > 0 then
			self.close()
		 else
			self.open()
			end
   		end  
	end


function popup:open()
	target = up_anchor
	poped = true
	end
 

function popup:close()
	target = down_anchor
	poped = false  
	end



function lerp(a, b, t)  return a + (b - a) * t end

return popup
