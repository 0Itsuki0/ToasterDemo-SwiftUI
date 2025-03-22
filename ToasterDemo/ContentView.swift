//
//  ContentView.swift
//  ToasterDemo
//
//  Created by Itsuki on 2025/03/22.
//

import SwiftUI
import Toaster

struct ContentView: View {
    @Environment(\.addToast) private var addToast
    @Environment(\.removeToast) private var removeToast
    
    @State private var toastId: ToastConfig.ID?
    @State private var showToastDismissMessage: Bool = false
    
    private let title = "Welcome"
    private let message = "Hello from Itsuki!"

    var body: some View {

        ScrollView {
            Text("Basic Usage")
                .fontWeight(.semibold)
            
            VStack(alignment: .leading) {
                HStack() {
                    Button(action: {
                        addToast(title: title)
                    }, label: {
                        Text("Default")
                    })
                    
                    Button(action: {
                        addToast(title: title, message: message)
                    }, label: {
                        Text("With Message")
                    })
                    
                    Button(action: {
                        let loadingConfig = LoadingConfig(promise: { await sleep(0.5) }, title: "Loading")
                        addToast(title: title, loadingConfig: loadingConfig)
                    }, label: {
                        Text("With Loading")
                    })
                    
                }
                
                HStack() {
                    Button(action: {
                        addToast(title: title, showIcon: false)

                    }, label: {
                        Text("Hidden Icon")
                    })
                    
                    Button(action: {
                        addToast(title: title, showCloseButton: false)

                    }, label: {
                        Text("Hidden Close button")
                    })
                    
                }
                
                HStack() {
                    Button(action: {
                        addToast(title: title, timeout: 1.0)
                    }, label: {
                        Text("Auto Disappear")
                    })
                    
                    Button(action: {
                        addToast(title: title, onDismiss: {
                            withAnimation {
                                showToastDismissMessage = true
                            }
                        })
                    }, label: {
                        Text("On Dismiss")
                    })

                }

            }
            
            Divider()
                .padding(.top, 8)
            
            Text("Controlled")
                .fontWeight(.semibold)
            HStack() {
                Button(action: {
                    self.toastId = addToast(title: title)
                }, label: {
                    Text("Add")
                })
                Button(action: {
                    if let toastId = self.toastId {
                        removeToast(toastId)
                    }
                }, label: {
                    Text("Remove")
                })
                
                Button(action: {
                    removeToast()
                }, label: {
                    Text("Remove all")
                })
            }
            
            Divider()
                .padding(.top, 8)
            
            Text("Placement")
                .fontWeight(.semibold)
            HStack() {
                Button(action: {
                    addToast(title: title, style: .init(placement: .top))
                }, label: {
                    Text("Top")
                })
                Button(action: {
                    addToast(title: title, style: .init(placement: .bottom))
                }, label: {
                    Text("Bottom")
                })
            }
            
            Divider()
                .padding(.top, 8)
            
            Text("Colors")
                .fontWeight(.semibold)
            
            VStack(alignment: .leading) {
                HStack() {
                    Button(action: {
                        addToast(title: title, style: .init(color: .default))
                    }, label: {
                        Text("Default")
                    })
                    Button(action: {
                        addToast(title: title, style: .init(color: .primary))
                    }, label: {
                        Text("Primary")
                    })
                    Button(action: {
                        addToast(title: title, style: .init(color: .secondary))

                    }, label: {
                        Text("Secondary")
                    })
                }
                HStack() {
                    Button(action: {
                        addToast(title: title, style: .init(color: .success))

                    }, label: {
                        Text("Success")
                    })
                    
                    Button(action: {
                        addToast(title: title, style: .init(color: .warning))

                    }, label: {
                        Text("Warning")
                    })
                    Button(action: {
                        addToast(title: title, style: .init(color: .danger))

                    }, label: {
                        Text("Danger")
                    })
                    Button(action: {
                        addToast(title: title, style: .init(color: .custom(Color.mint)))

                    }, label: {
                        Text("Custom")
                    })
                }
            }
            
            Divider()
                .padding(.top, 8)
            
            Text("Variant")
                .fontWeight(.semibold)
            
            HStack() {
                Button(action: {
                    addToast(title: title, style: .init(variant: .bordered))

                }, label: {
                    Text("Bordered")
                })
                Button(action: {
                    addToast(title: title, style: .init(variant: .solid))

                }, label: {
                    Text("Solid")
                })
            }
            
            
            Divider()
                .padding(.top, 8)
            
            Text("Radius")
                .fontWeight(.semibold)

            VStack(alignment: .leading) {
                HStack() {
                    Button(action: {
                        addToast(title: title, style: .init(radius: .none))

                    }, label: {
                        Text("None")
                    })
                    Button(action: {
                        addToast(title: title, style: .init(radius: .small))

                    }, label: {
                        Text("Small")
                    })
                    Button(action: {
                        addToast(title: title, style: .init(radius: .medium))

                    }, label: {
                        Text("Medium")
                    })
                    
                    Button(action: {
                        addToast(title: title, style: .init(radius: .large))

                    }, label: {
                        Text("Large")
                    })
 
                }
                
                HStack() {
                    Button(action: {
                        addToast(title: title, style: .init(radius: .full))

                    }, label: {
                        Text("Full")
                    })

                    Button(action: {
                        addToast(title: title, style: .init(radius: .custom(20)))
                    }, label: {
                        Text("Custom")
                    })
                }
            }
            
                    
            Divider()
                .padding(.top, 8)
            
            Text("Customize")
                .fontWeight(.semibold)
            
            HStack() {
                Button(action: {
                    addToast(title: title, customIcon: Image(systemName: "heart.fill"))
                }, label: {
                    Text("Custom Icon")
                })
                
                Button(action: {
                    addToast(content: {
                        VStack(spacing: 24){
                            HStack {
                                Image(systemName: "heart.fill")
                                Text(title)
                                Image(systemName: "heart.fill")
                            }

                            HStack {
                                Image(systemName: "heart.fill")
                                Text(message)
                                Image(systemName: "heart.fill")
                            }
                            .foregroundStyle(.red)
                        }
                    })
                }, label: {
                    Text("Custom View")
                })
            }

        }
        .overlay(alignment: .top, content: {
            if showToastDismissMessage {
                Text("Toast dismissed")
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 4).fill(.gray))
                    .padding(.bottom, 8)
                    .frame(maxWidth: .infinity)
                    .background(.white.opacity(0.7))
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                            showToastDismissMessage = false
                        })
                    }
            }
        })
        .foregroundStyle(.black)
        .buttonStyle(.bordered)
        .padding(.vertical, 16)
    }
    
    func sleep(_ seconds: Double) async {
        try? await Task.sleep(nanoseconds: UInt64(seconds * Double(NSEC_PER_SEC)))
    }

}

#Preview {
    ContentView()
        .provideToaster()
}
