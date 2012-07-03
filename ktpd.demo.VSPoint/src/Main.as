package
{
	import flash.utils.setTimeout;
	import flash.ui.Keyboard;
	import flash.events.KeyboardEvent;
	import flash.display.Sprite;
	import flash.display.Stage;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.geom.Point;
	import flash.system.Security;

	[ SWF ( frameRate="60" ,width="1680" , height="1000" ) ]
	public class Main extends Sprite
	{
		private var points : Points = new Points(10, 10, 500);

		public function Main()
		{
			points.generatePoints(900);
			initializeStage(stage);
			stage.addEventListener(KeyboardEvent.KEY_DOWN, onKeyDown);
		}

		private function onKeyDown(event : KeyboardEvent) : void
		{
			switch(event.keyCode)
			{
				case Keyboard.S:
					showPoints();
					break;
			}
		}

		private function showPoints() : void
		{
			var point : Point;
			for (var i : int = 0; i < points.list.length; i++)
			{
				point = points.list[i];
				setTimeout(drawPoint, 100 * i, point);
			}
		}

		private function drawPoint(point : Point) : void
		{
			var pointShape : PointShape = new PointShape();
			pointShape.x = point.x;
			pointShape.y = point.y;
			addChild(pointShape);
		}

		private function initializeStage(stage : Stage) : void
		{
			flash.system.Security.allowDomain("*");
			stage.quality = StageQuality.HIGH;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			transform.perspectiveProjection.projectionCenter = new Point(stage.stageWidth / 2, stage.stageHeight / 2);
		}
	}
}
