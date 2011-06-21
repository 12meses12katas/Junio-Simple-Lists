using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace kata.junio.lists.test
{
    [TestClass]
    public class TestLists
    {
        [TestMethod]
        public void TestMethod1()
        {
            IKataList list = new singlelinked.List();

            Assert.IsNull(list.Find("fred"));

            list.Add("fred");
            Assert.AreEqual("fred", list.Find("fred").Value);
            Assert.IsNull(list.Find("wilma"));
            list.Add("wilma");
            Assert.AreEqual("fred", list.Find("fred").Value);
            Assert.AreEqual("wilma", list.Find("wilma").Value);
            CollectionAssert.AreEqual(new string[] { "fred", "wilma" }, list.Values);

            list = new singlelinked.List();
            list.Add("fred");
            list.Add("wilma");
            list.Add("betty");
            list.Add("barney");
            CollectionAssert.AreEqual(new[] { "fred", "wilma", "betty", "barney" }, list.Values);
            list.Delete(list.Find("wilma"));
            CollectionAssert.AreEqual(new[] { "fred", "betty", "barney" }, list.Values);
            list.Delete(list.Find("barney"));
            CollectionAssert.AreEqual(new[] { "fred", "betty" }, list.Values);
            list.Delete(list.Find("fred"));
            CollectionAssert.AreEqual(new[] { "betty" }, list.Values);
            list.Delete(list.Find("betty"));
            CollectionAssert.AreEqual(new string[] { }, list.Values);
        }
    }
}