# Memo_App

---

### 프로젝트 개요

Memo App은 사용자가 메모를 작성, 수정, 삭제할 수 있는 간단한 iOS 애플리케이션입니다. 이 앱은 SwiftUI를 사용하여 현대적인 사용자 인터페이스를 제공하며, Core Data를 이용해 메모 데이터를 영구적으로 저장하고 관리합니다. 프로젝트를 통해 SwiftUI와 Core Data의 통합 방법을 익히고, MVVM 패턴을 적용하여 코드의 유지 보수성과 확장성을 높였습니다.

### 프로젝트 후기

Memo App 프로젝트는 SwiftUI와 Core Data를 실습하는 데 큰 도움이 되었습니다. SwiftUI를 이용해 사용자 인터페이스를 구축하면서, 선언형 프로그래밍의 장점을 경험할 수 있었고, Core Data를 통해 데이터의 영구 저장과 관리 방법을 깊이 있게 학습할 수 있었습니다. 이 프로젝트를 통해 iOS 애플리케이션 개발의 전반적인 흐름을 이해하게 되었고, 실질적인 문제 해결 능력을 키울 수 있었습니다. 특히, MVVM 패턴을 적용함으로써 코드의 가독성과 유지 보수성을 높일 수 있었던 점이 유익했습니다.

---

### 기능 설명

- **메모 추가**: 사용자는 새로운 메모를 추가할 수 있습니다. 메모 추가 화면에서 제목과 내용을 입력하고 저장하면 메모가 Core Data에 저장됩니다.
- **메모 삭제**: 사용자는 메모 목록에서 불필요한 메모를 삭제할 수 있습니다. 삭제된 메모는 Core Data에서 제거됩니다.
- **메모 수정**: 기존 메모의 내용을 수정할 수 있으며, 수정된 내용은 Core Data에 업데이트됩니다.
- **메모 조회**: 저장된 메모를 리스트에서 선택하여 상세 내용을 확인할 수 있습니다.

---

### 기술 스택

- **Swift**: 애플의 프로그래밍 언어로, iOS 앱 개발에 사용됩니다.
- **SwiftUI**: 애플의 UI 프레임워크로, 선언적인 방법으로 사용자 인터페이스를 구축할 수 있습니다.
- **Core Data**: 애플의 데이터 관리 프레임워크로, 데이터를 저장하고 관리하는 데 사용됩니다.
- **Xcode**: 애플의 통합 개발 환경(IDE)으로, iOS 앱 개발에 사용됩니다.

---

### 구현 과정

- **AppDelegate 설정**: 앱이 실행될 때 필요한 초기 설정을 수행합니다.
- **메모 추가 기능**: 사용자가 제목과 내용을 입력하여 새로운 메모를 추가할 수 있습니다.
- **메모 편집 기능**: 사용자가 기존 메모를 선택하여 제목과 내용을 수정할 수 있습니다.
- **메모 삭제 기능**: 사용자가 리스트에서 메모를 삭제할 수 있습니다.

---

### 스크린샷

1. 메인 화면
    
    ![스크린샷 2024-06-05 오후 3.40.52.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/f9f35de7-0091-4a79-819a-501ef9435828/8f854617-c919-4297-8e9e-bff50aa56ef2/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-06-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_3.40.52.png)
    
2. 메모 추가 화면
    
    
    ![스크린샷 2024-06-05 오후 3.41.14.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/f9f35de7-0091-4a79-819a-501ef9435828/b896ce70-a0cf-4462-8654-a63d1275b014/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-06-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_3.41.14.png)
    
3. 메모 수정 화면
    
    
    ![스크린샷 2024-06-05 오후 3.41.21.png](https://prod-files-secure.s3.us-west-2.amazonaws.com/f9f35de7-0091-4a79-819a-501ef9435828/0688ff95-6998-4572-af26-eca2184c48bc/%E1%84%89%E1%85%B3%E1%84%8F%E1%85%B3%E1%84%85%E1%85%B5%E1%86%AB%E1%84%89%E1%85%A3%E1%86%BA_2024-06-05_%E1%84%8B%E1%85%A9%E1%84%92%E1%85%AE_3.41.21.png)
    
    ---
    
    ### 주요 코드 스니펫 및 상세 설명
    
    1. Memo.swift
    
    ```swift
    import Foundation
    import CoreData
    
    @objc(Memo)
    public class Memo: NSManagedObject {
    }
    
    extension Memo {
        @nonobjc public class func fetchRequest() -> NSFetchRequest<Memo> {
            return NSFetchRequest<Memo>(entityName: "Memo")
        }
    
        @NSManaged public var title: String?
        @NSManaged public var content: String?
        @NSManaged public var date: Date?
    
        var wrappedTitle: String {
            title ?? "제목 없음"
        }
    
        var wrappedContent: String {
            content ?? "내용 없음"
        }
    }
    
    extension Memo: Identifiable {
    }
    
    ```
    
    1. MemoListView.swift
    
    ```swift
    import SwiftUI
    import CoreData
    
    struct MemoListView: View {
        @Environment(\.managedObjectContext) private var viewContext
        @FetchRequest(
            entity: Memo.entity(),
            sortDescriptors: [NSSortDescriptor(keyPath: \Memo.date, ascending: true)],
            animation: .default)
        private var memos: FetchedResults<Memo>
    
        @State private var showingAddMemoView = false
    
        var body: some View {
            NavigationView {
                List {
                    ForEach(memos) { memo in
                        NavigationLink(destination: MemoDetailView(memo: memo)) {
                            Text(memo.wrappedTitle)
                        }
                    }
                    .onDelete(perform: deleteMemos)
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: {
                            showingAddMemoView = true
                        }) {
                            Label("Add Memo", systemImage: "plus")
                        }
                    }
                }
                .sheet(isPresented: $showingAddMemoView) {
                    AddMemoView().environment(\.managedObjectContext, viewContext)
                }
                .navigationTitle("Memos")
            }
        }
    
        private func deleteMemos(offsets: IndexSet) {
            withAnimation {
                offsets.map { memos[$0] }.forEach(viewContext.delete)
    
                do {
                    try viewContext.save()
                } catch {
                    let nsError = error as NSError
                    fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
                }
            }
        }
    }
    
    ```
    
    1. AddMemoView.swift
    
    ```swift
    import SwiftUI
    
    struct AddMemoView: View {
        @Environment(\.managedObjectContext) private var viewContext
        @Environment(\.presentationMode) var presentationMode
    
        @State private var title: String = ""
        @State private var content: String = ""
    
        var body: some View {
            NavigationView {
                Form {
                    Section(header: Text("제목")) {
                        TextField("제목을 입력하세요", text: $title)
                    }
    
                    Section(header: Text("내용")) {
                        TextEditor(text: $content)
                    }
                }
                .navigationBarTitle("새 메모", displayMode: .inline)
                .navigationBarItems(trailing: Button("저장") {
                    addMemo()
                })
            }
        }
    
        private func addMemo() {
            let newMemo = Memo(context: viewContext)
            newMemo.title = title
            newMemo.content = content
            newMemo.date = Date()
    
            do {
                try viewContext.save()
                presentationMode.wrappedValue.dismiss()
            } catch {
                // Handle the error appropriately
                print("Failed to save memo: \(error.localizedDescription)")
            }
        }
    }
    
    ```
    
    1. MemoDetailView.swift
    
    ```swift
    import SwiftUI
    
    struct MemoDetailView: View {
        @ObservedObject var memo: Memo
    
        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) { // alignment와 spacing 명시
                    Text(memo.wrappedTitle)
                        .font(.title) // 제목의 글자 크기 설정
                        .fontWeight(.bold) // 제목의 글자 굵기 설정
                        .frame(maxWidth: .infinity, alignment: .leading) // 제목의 정렬을 왼쪽으로 설정
                        .padding(.bottom, 5)
                    Text(memo.wrappedContent)
                        .font(.body) // 내용의 글자 크기 설정
                        .frame(maxWidth: .infinity, alignment: .leading) // 내용의 정렬을 왼쪽으로 설정
                        .padding(.bottom, 5)
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Memo Details")
            .navigationBarTitleDisplayMode(.inline) // 제목이 중앙에 위치하도록 설정
        }
    }
    
    struct MemoDetailView_Previews: PreviewProvider {
        static var previews: some View {
            let viewContext = PersistenceController.shared.container.viewContext
            let newMemo = Memo(context: viewContext)
            newMemo.title = "Sample Title"
            newMemo.content = "Sample Content"
            newMemo.date = Date()
    
            return NavigationView {
                MemoDetailView(memo: newMemo)
                    .environment(\.managedObjectContext, viewContext)
            }
        }
    }
    
    ```
    
    ```swift
    import SwiftUI
    
    struct MemoDetailView: View {
        @ObservedObject var memo: Memo
    
        var body: some View {
            ScrollView {
                VStack(alignment: .leading, spacing: 10) { // alignment와 spacing 명시
                    Text(memo.wrappedTitle)
                        .font(.title) // 제목의 글자 크기 설정
                        .fontWeight(.bold) // 제목의 글자 굵기 설정
                        .frame(maxWidth: .infinity, alignment: .leading) // 제목의 정렬을 왼쪽으로 설정
                        .padding(.bottom, 5)
                    Text(memo.wrappedContent)
                        .font(.body) // 내용의 글자 크기 설정
                        .frame(maxWidth: .infinity, alignment: .leading) // 내용의 정렬을 왼쪽으로 설정
                        .padding(.bottom, 5)
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Memo Details")
            .navigationBarTitleDisplayMode(.inline) // 제목이 중앙에 위치하도록 설정
        }
    }
    
    struct MemoDetailView_Previews: PreviewProvider {
        static var previews: some View {
            let viewContext = PersistenceController.shared.container.viewContext
            let newMemo = Memo(context: viewContext)
            newMemo.title = "Sample Title"
            newMemo.content = "Sample Content"
            newMemo.date = Date()
    
            return NavigationView {
                MemoDetailView(memo: newMemo)
                    .environment(\.managedObjectContext, viewContext)
            }
        }
    }
    
    ```
