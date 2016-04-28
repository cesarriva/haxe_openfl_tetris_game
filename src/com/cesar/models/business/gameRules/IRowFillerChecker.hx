package com.cesar.models.business.gameRules;
import com.cesar.models.shapes.BaseShape;

/**
 * Interface to handle the row fill
 * @author Cesar Riva
 */
interface IRowFillerChecker 
{
	/**
	 * Returns a array with the Y blocks coordinates used to form
	 * a shape
	 * @param	shape
	 * @return Array<Int> containing Y coordinates
	 */
	public function getYCoordinatesForTheShape(shape:BaseShape):Array<Int>;
	
	/**
	 * Check if the row was already filled based on the Y coordinates informed. Yes yes, 
	 * remove this filled rows and update all rows above the erased ones, return a new
	 * updated board Array<Array<Bool>>
	 * @param	yCoordinates
	 * @param	board
	 * @return
	 */
	public function handleRowFillAndUpdateBoard(yCoordinates:Array<Int>, board:Array<Array<Bool>>):Void;
}