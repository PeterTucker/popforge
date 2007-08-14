package de.popforge.interpolation
{
	import de.popforge.parameter.IMapping;
	
	import flash.geom.Point;
	
	/**
	 * The InterpolationLinear class an extension to the Interpolation class using
	 * linear interpolation.
	 * 
	 * @author Joa Ebert
	 * @see de.popforge.interpolation.Interpolation Interpolation
	 */	
	final public class InterpolationLinear extends Interpolation
	{
		/**
		 * Creates a new InterpolationLinear object.
		 * 
		 * @param mapping The IMapping object used to map the normalized value.
		 */			
		public function InterpolationLinear( mapping: IMapping = null )
		{
			super( mapping );
		}
		
		/**
		 * Calculates the linear interpolated value <em>y</em> for <em>x</em> based on the control points.
		 * 
		 * @param x Normalized position on the <em>x</em>-axis.
		 * @return The <em>y</em> value at given position <em>x</em>.
		 * 
		 */	
		override protected function interpolate( x: Number ): Number
		{
			var index: uint = findPointBefore( x );
			
			var p0: Point = points[ index ];
			var p1: Point;
			
			if ( ( index + 1 ) == numPoints )
			{
				p1 = p0;
			}
			else
			{
				p1 = points[ index + 1 ];
			}
			
			return clamp( p0.y + ( p1.y - p0.y ) * ( ( x - p0.x ) / ( p1.x - p0.x ) ) );
		}
		
		/**
		 * Creates the string representation of the current object.
		 * @return The string representation of the current object.
		 * 
		 */	
		override public function toString(): String
		{
			return '[InterpolationLinear]';
		}
	}
}