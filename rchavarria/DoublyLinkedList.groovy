
class DoublyLinkedList {
    
    private DoubleNode head
    
    public add(String value){
        DoubleNode node = new DoubleNode(value:value)
        
        if(head == null){
            head = node
        } else {
            DoubleNode cursor = head
            while(cursor.next != null){
                cursor = cursor.next
            }
            cursor.next = node
            node.prev = cursor
        }
    }
    
    public DoubleNode find(String value){
        DoubleNode cursor = head
        while(cursor != null){
            if(cursor.value == value) break
                cursor = cursor.next
        }
        cursor
    }
    
    public List values(){
        List vals = []
        DoubleNode cursor = head
        while(cursor != null){
            vals << cursor.value
            cursor = cursor.next
        }
        
        vals
    }
    
    public delete(DoubleNode nodeToDelete){
        DoubleNode cursor = head
        while(cursor != null){
            if(cursor.value == nodeToDelete.value){
                cursor.prev?.next = cursor.next
                cursor.next?.prev = cursor.prev
                if(isFirst(cursor)) head = cursor.next 
                break
            }
            cursor = cursor.next
        }
    }
    
    private boolean isFirst(DoubleNode node) {
        node == null || node.prev == null
    }
}