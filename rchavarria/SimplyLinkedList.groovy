
class SimplyLinkedList {
    
    private Node head
    private int size = 0
    
    public add(String value){
        Node node = new Node(value:value)
        
        if(isFirst(size)){
            head = node
        } else {
            searchLast().next = node
        }
        size++
    }
    
    private Node searchLast(){
        Node cursor = head
        while(cursor.next != null){
            cursor = cursor.next
        }
        cursor
    }
    
    public Node find(String value){
        Node cursor = head
        for(int i = 0; i < size; i++){
            if(cursor.value == value) return cursor
            cursor = cursor.next
        }
    }
    
    public List values(){
        List vals = []
        Node cursor = head
        for(int i = 0; i < size; i++){
            vals << cursor.value
            cursor = cursor.next
        }
        
        vals
    }
    
    public delete(Node nodeToDelete){
        Node cursor = head
        for(int i = 0; i < size; i++){
            if(cursor.value == nodeToDelete.value){ 
                deleteNode(i)
                break
            }
            cursor = cursor.next
        }
    }
    
    private deleteNode(int idx){
        if(isFirst(idx)){
            head = head.next
        } else {
            Node cursor = head
            for(int i = 0; i < (idx - 1); i++)
                cursor = cursor.next
            cursor.next = cursor.next.next
        }
        
        size--
    }
    
    private boolean isFirst(int idx) { idx == 0
    }
}