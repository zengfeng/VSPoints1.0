package
{
	import flash.geom.Point;

	/**
	 * @author ZengFeng (zengfeng75[AT]163.com) 2012-7-3
	 */
	public class Points
	{
		public var x : int;
		public var y : int;
		public var lineLength : int;
		public var count : int;
		public var list : Vector.<Point> = new Vector.<Point>();
		private var part : Array = [16, 0, 32, 8, 24, 4, 18, 12, 20, 2, 30, 14, 18, 6, 26, 10, 22, 1, 15, 31, 5, 21, 13, 27, 3, 17, 11, 23, 29, 9, 19, 25, 7];

		function Points(x : int = 10, y : int = 10, lineLength : int = 500) : void
		{
			this.x = x;
			this.y = y;
			this.lineLength = lineLength;
		}

		public function generatePoints(count : int = 90) : void
		{
			this.count = count;
			var point : Point;
			for (var i : int = 0; i < count; i++)
			{
				point = new Point(x, y + getPartPosition(i, lineLength));
				list.push(point);
			}
		}

		/** 求线段的位置 */
		private function getPartPosition(id : int, length : int) : int
		{
			// 2的次方数
			var n : int = Math.floor(id / 2) + 1;
			if (id > 3)
			{
				n = 1;
				var num : int = 1;
				while (1 > 0)
				{
					n++;
					num = 2 * num;
					if (id < num * 2)
					{
						break;
					}
				}
			}
			// 分成多少段
			var part : int = Math.pow(2, n);
			// 分成多少段后的第几段
			var index : int;
			// 如果是1
			if (id == 1)
			{
				index = 0;
			}
			// 如果是偶数
			else if (id % 2 == 0)
			{
				index = part - id - 2;
			}
			// 如果是奇数
			else
			{
				// index = part / 2 + (Math.floor((id - part / 2 )) - 1) * 2;
				index = id - 1;
			}

			// 求值 = 第小段 * (索引 + 1)
			var value : int = (length / part) * (index + 1);
			// trace("id = " + id + "    n = " + n + "   part = " + part + "    index = " + index + "   value = " + value);
			return value;
		}

		public function getPoint(pointId : int) : void
		{
		}

		public function recycle(point : Point) : void
		{
		}
	}
}
