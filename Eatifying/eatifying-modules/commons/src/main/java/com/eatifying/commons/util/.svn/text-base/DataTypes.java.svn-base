

package com.eatifying.commons.util;

import java.util.Collection;
import java.util.Map;

public class DataTypes
{
	/**
     * The undefined value in the system
     * Objects if null are well understood to be undefined if null,
     * but primitive types are not.
     * It is safe to use DataTypes class to get the undefined value
     * and check for the same using isDefined methods.
     * This is also required because of the inconsistencies in
     * numeric comparisions for double and float values.
     * Due to the above reasons, this variable is deprecated.
     */
    @Deprecated
    public static final int UNDEFINED_VALUE = -1;
	
	/**
	 * Returns the undefined value in the system
	 */
	public static int getUndefinedValue()
	{
		return UNDEFINED_VALUE;
	}

	/**
	 * Returns the undefined Long value in the system
	 */
	public static long getUndefinedLongValue()
	{
		return getUndefinedValue();
	}

	/**
	 * Returns the undefined Long value in the system
	 */
	public static double getUndefinedDoubleValue()
	{
		return getUndefinedValue();
	}

	/**
	 * Checks if input object is null
	 *
	 * @param o
	 * @return
	 */
	public static boolean isNull(Object o)
	{
		return (o == null);
	}

	/**
	 * Checks if input object is not null
	 *
	 * @param o
	 * @return
	 */
	public static boolean isNotNull(Object o)
	{
		return (o != null);
	}

	/**
	 * Checks if the input object is defined
	 *
	 * @param o
	 * @return
	 */
	public static boolean isDefined(Object o)
	{
		return (o != null);
	}

	/**
	 * Checks if the input string is defined.
	 * For this method to return true, the input
	 * string should be not null and the length
	 * should be greater than 0
	 *
	 * @param o
	 * @return
	 */
	public static boolean isDefined(String o)
	{
		return (o != null && o.trim().length() > 0);
	}

	/**
	 * Checks if the input number is defined
	 *
	 * @param o
	 * @return
	 */
	public static boolean isDefined(Number o)
	{
		return (o != null && isDefined(o.intValue()));
	}

	/**
	 * Checks if the input int is defined
	 *
	 * @param o
	 * @return
	 */
	public static boolean isDefined(int i)
	{
		return (i != UNDEFINED_VALUE);
	}

	/**
	 * Checks if the input long is defined
	 *
	 * @param o
	 * @return
	 */
	public static boolean isDefined(long i)
	{
		return isDefined((int) i);
	}

	/**
	 * Checks if the input double is defined
	 *
	 * @param o
	 * @return
	 */
	public static boolean isDefined(double i)
	{
		return isDefined((int) i);
	}

	/**
	 * Checks if the collection is null or empty.
	 * Returns true only if it contains some element
	 *
	 * @param Collection
	 * @return
	 */
	public static boolean isDefined(Collection<?> coll)
	{
		return coll != null && coll.size() > 0;
	}

	/**
	 * Checks if the map is null or empty.
	 * Returns true only if it contains some element
	 *
	 * @param Map
	 * @return
	 */
	public static boolean isDefined(Map<?, ?> map)
	{
		return map != null && map.size() > 0;
	}

}
