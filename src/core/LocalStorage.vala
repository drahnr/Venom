/*
 *    Copyright (C) 2013 Venom authors and contributors
 *
 *    This file is part of Venom.
 *
 *    Venom is free software: you can redistribute it and/or modify
 *    it under the terms of the GNU General Public License as published by
 *    the Free Software Foundation, either version 3 of the License, or
 *    (at your option) any later version.
 *
 *    Venom is distributed in the hope that it will be useful,
 *    but WITHOUT ANY WARRANTY; without even the implied warranty of
 *    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 *    GNU General Public License for more details.
 *
 *    You should have received a copy of the GNU General Public License
 *    along with Venom.  If not, see <http://www.gnu.org/licenses/>.
 */

namespace Venom {
  public class LocalStorage : Object {

  	public int init_db() {

  	  Sqlite.Database db;
	  string errmsg;

  	  // Open/Create a database:
	  int ec = Sqlite.Database.open ("test.db", out db);
	  if (ec != Sqlite.OK) {
	    stderr.printf ("Can't open database: %d: %s\n", db.errcode (), db.errmsg ());
	    return -1;
	  }

	  const string query = """
		CREATE TABLE IF NOT EXISTS User (
			id		INT		PRIMARY KEY		NOT NULL,
			name	TEXT					NOT NULL
		);
		""";

	// Execute our query:
	ec = db.exec (query, null, out errmsg);
	if (ec != Sqlite.OK) {
		stderr.printf ("Error: %s\n", errmsg);
		return -1;
	}

	stdout.printf ("Created.\n");

	return 0;

  	}


  }
}