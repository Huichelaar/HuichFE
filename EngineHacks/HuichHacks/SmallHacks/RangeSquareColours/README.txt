It seems that vanilla only uses bits 0, 1, 2 and 4 of the +0x4A bitfield in Proc_MoveLimitView. I've repurposed bit 15 for purple range squares. Now the setup is like such:

Range Display Type bitfield:
	 &0x01    | Move  Squares are Blue
	 &0x02    | Range Squares are Red
	 &0x04    | Range Squares are Green
	 &0x10    | Range Squares are Blue
   &0x8000  | Range Squares are Purple