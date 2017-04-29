<<<<<<< HEAD

package org.gjt.mm.mysql;

import java.sql.SQLException;


public class Driver extends com.mysql.jdbc.Driver {

	public Driver() throws SQLException {
		super();
	}
}
=======
package org.gjt.mm.mysql;

import java.sql.SQLException;

/**
 * Here for backwards compatibility with MM.MySQL
 *
 *
 */
public class Driver extends com.mysql.jdbc.Driver {
	// ~ Constructors
	// -----------------------------------------------------------

	/**
	 * Creates a new instance of Driver
	 *
	 * @throws SQLException
	 *             if a database error occurs.
	 */
	public Driver() throws SQLException {
		super();
	}
}

>>>>>>> branch 'master' of https://github.com/SoftwareTechnologyCourse/Agriculture_Farm_Manager
