var SimpleElement = require('./SimpleList.js').SimpleElement;

exports["test add and find features"] = function(test){
	var fred = new SimpleElement("fred");
        test.equals(fred.find("wilma"), null);
        
        var wilma = new SimpleElement("wilma");
        fred.add(wilma);
        test.equals(fred.find("wilma"), wilma);
        
        var betty = new SimpleElement("betty");
        wilma.add(betty);
        test.equals(fred.find("betty"), betty);
        test.equals(wilma.find("fred"), null);
	test.done();
};

exports["test delete and to array features"] = function(test){
	var fred = new SimpleElement("fred");
        var wilma = new SimpleElement("wilma");
        var betty = new SimpleElement("betty");
        var barney = new SimpleElement("barney");
        fred.add(wilma);
        wilma.add(betty);
        betty.add(barney);
        
        var all;

	all = fred.getAll();
	test.equals(all.length, 4);
	test.equals(fred.find("fred"), fred);
	test.equals(fred.find("barney"), barney);

	fred.remove(wilma);
	all = fred.getAll();
        test.equals(all.length, 3);
	test.equals(fred.find("fred"), fred);
        test.equals(fred.find("barney"), barney);	
	test.equals(fred.find(wilma), null);

	fred.remove(barney);
	all = fred.getAll();
        test.equals(all.length, 2);
	test.equals(fred.find("fred"), fred);
        test.equals(fred.find("betty"), betty);
	test.equals(fred.find(barney), null);

	test.equals(betty.remove(fred), false);
	test.done();

};
